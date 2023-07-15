package regalloc

import gen.asm._

import scala.collection.{immutable, mutable}

/**
 *
 * @author Zachary Hayden
 *         Date: 3/1/23
 */

/**
 * A very naive register allocator which allocates each virtual registers in the data section with a label.
 * The allocator assumes that each function has a single corresponding text section.
 */
object NaiveRegAlloc extends AssemblyPass {
  private def collectVirtualRegisters(section: AssemblyProgram.Section): mutable.Map[Register.Virtual, Label] = {
    val vrMap: mutable.Map[Register.Virtual, Label] = mutable.HashMap.empty

    section.items.foreach {
      case instruction: Instruction => instruction.registers().foreach {
        case vr: Register.Virtual =>
          val l: Label = Label.create(vr.toString)
          vrMap.put(vr, l)
        case _ =>
      }
      case _ => // nothing to do
    }
    vrMap
  }

  private def emitInstructionWithoutVirtualRegister(insn   : Instruction,
                                                    vrMap  : mutable.Map[Register.Virtual, Label],
                                                    section: AssemblyProgram.Section): Unit = {
    section.emit("Original instruction: " + insn)

    // virtual register to arch register
    val vrToAr: mutable.Map[Register, Register] = mutable.Map.empty
    val tempRegs: Array[Register] = Array(Register.Arch.t0, Register.Arch.t1, Register.Arch.t2, Register.Arch.t3,
                                          Register.Arch.t4,
                                          Register.Arch.t5) // 6 temporaries should be more than enough

    val freeTempRegs: mutable.Stack[Register] = new mutable.Stack[Register]()
    tempRegs.foreach(freeTempRegs.push)

    // creates a map from virtual register to temporary architecture register for all registers appearing in the instructions
    insn.registers().foreach((reg) => {
      if (reg.isVirtual) {
        val tmp: Register = freeTempRegs.pop
        val label: Label = vrMap(reg.asInstanceOf[Register.Virtual])
        vrToAr.put(reg, tmp)
      }

    })

    // load the values of any virtual registers used by the instruction from memory into a temporary architectural register
    insn.uses.foreach((reg) => {
      if (reg.isVirtual) {
        val tmp: Register = vrToAr(reg)
        val label = vrMap(reg.asInstanceOf[Register.Virtual])
        section.emit(OpCode.LA, tmp, label)
        section.emit(OpCode.LW, tmp, tmp, 0)
      }

    })

    // emit new instructions where all virtual register have been replaced by architectural ones
    section.emit(insn.rebuild(vrToAr))

    if (insn.define().isDefined) {
      if (insn.define().get.isVirtual) {
        val tmpVal: Register = vrToAr(insn.define().get)
        val tmpAddr: Register = freeTempRegs.pop()
        val label: Label = vrMap(insn.define().get.asInstanceOf[Register.Virtual])

        section.emit(OpCode.LA, tmpAddr, label)
        section.emit(OpCode.SW, tmpVal, tmpAddr, 0)
      }
    }
  }

  private def run(prog: AssemblyProgram): AssemblyProgram = {
    val newProg: AssemblyProgram = new AssemblyProgram()

    // we assume that each function has a single corresponding text section
    prog.sections.foreach((section) => {
      if (section.sectionType == AssemblyProgram.Section.SectionType
                                                .DATA) newProg.emitSection(section)
      else {
        assert(((section.sectionType == AssemblyProgram.Section.SectionType.TEXT)))

        // map from virtual register to corresponding uniquely created label
        val vrMap = collectVirtualRegisters(section)

        // allocate one label for each virtual register in a new data section
        val dataSec: AssemblyProgram.Section = newProg.newSection(AssemblyProgram.Section.SectionType.DATA)
        if (vrMap.nonEmpty) dataSec.emit("Allocated labels for virtual registers")
        vrMap.foreach(vr => {
          dataSec.emit(vr._2)
          dataSec.emit(Directive("space " + 4))
        })

        // emit new instructions that don't use any virtual registers and transform push/pop registers instructions into real sequence of instructions
        // When dealign with push/pop registers, we assume that if a virtual register is used in the section, then it must be written into.
        val newSection: AssemblyProgram.Section = newProg.newSection(AssemblyProgram.Section.SectionType.TEXT)
        val vrLabels: immutable.List[Label] = vrMap.values.toList
        val reverseVrLabels: immutable.List[Label] = vrLabels.map(identity).reverse

        val lblSet = mutable.Set.empty[Label]
        section.items.foreach {
          case comment: Comment => newSection.emit(comment)
          case label: Label => { // TODO: check if this is correct
            if (lblSet.contains(label)) newSection.emit(label) else newSection.emit(Label.get(label.name + ":"))
          }
          case directive: Directive => newSection.emit(directive)
          case insn: Instruction => {
            if (insn == Instruction.Nullary.pushRegisters) {
              newSection.emit("Original instruction: pushRegisters")

              for (l <- vrLabels) {
                // load content of memory at label into $t0
                newSection.emit(OpCode.LA, Register.Arch.t0, l)
                newSection.emit(OpCode.LW, Register.Arch.t0, Register.Arch.t0, 0)

                // push $t0 onto stack
                newSection.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -(4))
                newSection.emit(OpCode.SW, Register.Arch.t0, Register.Arch.sp, 0)
              }
            }
            else if (insn == Instruction.Nullary.popRegisters) {
              newSection.emit("Original instruction: popRegisters")
              for (l <- reverseVrLabels) {
                // pop from stack into $t0
                newSection.emit(OpCode.LW, Register.Arch.t0, Register.Arch.sp, 0)
                newSection.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, 4)
                // store content of $t0 in memory at label
                newSection.emit(OpCode.LA, Register.Arch.t1, l)
                newSection.emit(OpCode.SW, Register.Arch.t0, Register.Arch.t1, 0)
              }
            } else {
              emitInstructionWithoutVirtualRegister(insn, vrMap, newSection)
            }

          }
        }
      }

    })
    newProg
  }

  def apply(program: AssemblyProgram): AssemblyProgram = {
    NaiveRegAlloc.run(program)
  }

}

