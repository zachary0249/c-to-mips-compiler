package regalloc

import gen.asm._
import regalloc.ControlFlowGraph.Node

import scala.collection.{immutable, mutable}

/**
 *
 * @author Zachary Hayden
 *         Date: 3/24/23
 */
object GraphColouringRegAlloc extends AssemblyPass {
  override def apply(program: AssemblyProgram): AssemblyProgram = {
    val newProg: AssemblyProgram = new AssemblyProgram()

    // we assume that each function has a single corresponding text section
    program.sections.foreach(section => {

      if (section.sectionType == AssemblyProgram.Section.SectionType.DATA)
        newProg.emitSection(section)
      else {
        assert(section.sectionType == AssemblyProgram.Section.SectionType.TEXT)

        // build the control flow graph
        println("BUILDING CFG")
        val controlFlowGraph = buildCFG(section.items)

        // collect the live-in / live-out sets from the graph
        println("RUNNING LIVENESS ANALYSIS")
        val liveSets = controlFlowGraph.runLivenessAnalysis()
        //controlFlowGraph.livenessToDot("dot/liveness_2_liveness", liveSets)

        // build the conflict graph based on the live sets
        println("BUILDING CONFLICT GRAPH")
        val conflictGraph = buildConflictGraph(liveSets)
        //conflictGraph.toDot("dot/tictactoe_conflict")

        // do a pass on conflict graph and attach data to each node that'll be used in determining which to spill
        conflictGraph.fillInUsageInfo(controlFlowGraph)

        // color graph and get registers to be spilled and vr to ar map
        val (toBeSpilled, vrToAr) = conflictGraph.colorGraph()

        // allocate some memory to data section to map spilled register to
        val dataSec = newProg.newSection(AssemblyProgram.Section.SectionType.DATA)
        if (toBeSpilled.nonEmpty) dataSec.emit("Allocated labels for spilled registers")
        val spillMap = mutable.Map[Register, Label]() // map from the register to label in memory its stored
        toBeSpilled.foreach(r => {
          // emit memory label for register
          val lbl = Label.create(r.asInstanceOf[Register.Virtual].toString)
          spillMap += (r.asInstanceOf[Register.Virtual] -> lbl)
          dataSec.emit(lbl)
          dataSec.emit(Directive("space " + 4))
        })

        val newSection: AssemblyProgram.Section = newProg.newSection(AssemblyProgram.Section.SectionType.TEXT)
        val spillLabels: immutable.List[Label] = spillMap.values.toList
        val reverseSpillLabels: immutable.List[Label] = spillLabels.map(identity).reverse

        // loop through instructions substituting virtual with arch registers using mapping
        // use a load / save operation if virtual register is to be spilled
        section.items.foreach {
          case comment: Comment => newSection.emit(comment)
          case directive: Directive => newSection.emit(directive)
          case label: Label => newSection.emit(label)
          case instruction: Instruction => {
            // handle push registers
            if (instruction == Instruction.Nullary.pushRegisters) {
              newSection.emit("Original instruction: pushRegisters")
              // must push the spilled registers as well as the colored registers
              // TODO: look at filtering out only the variables that get used in the function to push
              for (l <- spillLabels) {
                // load content of memory at label into $t0
                newSection.emit(OpCode.LA, Register.Arch.t0, l)
                newSection.emit(OpCode.LW, Register.Arch.t0, Register.Arch.t0, 0)

                // push $t0 onto stack
                newSection.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -(4))
                newSection.emit(OpCode.SW, Register.Arch.t0, Register.Arch.sp, 0)
              }

              // handle the colored registers
              for (archReg <- vrToAr.values) {
                // push the register onto stack
                newSection.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -(4))
                newSection.emit(OpCode.SW, archReg, Register.Arch.sp, 0)
              }

            } else if (instruction == Instruction.Nullary.popRegisters) {
              newSection.emit("Original instruction: popRegisters")

              // pop the colored registers from stack
              for (aReg <- vrToAr.values.toList.reverse) {
                // load value from stack back into assigned colored register
                newSection.emit(OpCode.LW, aReg, Register.Arch.sp, 0)
                newSection.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, 4)
              }

              // pop the spilled registers from stack
              for (l <- reverseSpillLabels) {
                // pop from stack into $t0
                newSection.emit(OpCode.LW, Register.Arch.t0, Register.Arch.sp, 0)
                newSection.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, 4)
                // store content of $t0 in memory at label
                newSection.emit(OpCode.LA, Register.Arch.t1, l)
                newSection.emit(OpCode.SW, Register.Arch.t0, Register.Arch.t1, 0)
              }

            } else {
              // emit the instruction without virtual registers
              emitInstructionWithoutVirtualRegister(instruction, spillMap, vrToAr, newSection)
            }
          }
        }
      }
    })

    newProg
  }

  private def emitInstructionWithoutVirtualRegister(instruction: Instruction,
                                                    spillMap   : mutable.Map[Register, Label],
                                                    vrToAr     : mutable.Map[Register, Register],
                                                    section    : AssemblyProgram.Section): Unit = {
    section.emit("Original instruction: " + instruction)

    val spillRegs = Array(Register.Arch.t1, Register.Arch.t0) // 3 temp for spills
    val freeSpillRegs = mutable.Stack[Register]()
    spillRegs.foreach(freeSpillRegs.push)

    // adding spill virtual register to spill arch register to virtual -> arch register map
    val vrToArWithSpillRegs = vrToAr.clone()
    instruction.registers().filter(r => spillMap.contains(r) && r.isVirtual).foreach(reg => {
      // if we need 3 registers for the instruction re-use $t0 as
      val tmp = if (freeSpillRegs.nonEmpty) freeSpillRegs.pop() else Register.Arch.t0
      val label = spillMap(reg)
      vrToArWithSpillRegs += (reg -> tmp)

    })

    // if instruction uses a spill register then load from memory
    instruction.uses().filter(r => spillMap.contains(r) && r.isVirtual).foreach(r => {
      val tmp = vrToArWithSpillRegs(r)
      val label = spillMap(r)
      section.emit(OpCode.LA, tmp, label)
      section.emit(OpCode.LW, tmp, tmp, 0)
    })

    section.emit(instruction.rebuild(vrToArWithSpillRegs))

    if (instruction.define().isDefined && instruction.define().get.isVirtual && spillMap
      .contains(instruction.define().get)) {
      val tmp = vrToArWithSpillRegs(instruction.define().get)
      val tmpAddr = freeSpillRegs.pop()
      val label = spillMap(instruction.define().get)

      section.emit(OpCode.LA, tmpAddr, label)
      section.emit(OpCode.SW, tmp, tmpAddr, 0)
    }

  }

  def buildCFG(items: mutable.Buffer[AssemblyItem]): ControlFlowGraph = {
    val cfg = ControlFlowGraph()
    // add each instruction as a node to cfg; just creating linear edges between instructions
    addInstructionsToCFG(items, cfg)
    // attach labels to the instruction that proceeds it
    attachEdgesToCFG(cfg)
    cfg
  }

  private def attachEdgesToCFG(controlFlowGraph: ControlFlowGraph): Unit = {
    val labelVertexMap = buildLabelToVertexMap(controlFlowGraph)
    val it = controlFlowGraph.nodes.iterator.buffered
    while (it.hasNext) {
      val v = it.next()
      if (v.goToLabel.nonEmpty && labelVertexMap.contains(v.goToLabel.get)) v.addToAdj(labelVertexMap(v.goToLabel.get))
      // add successive edge from one vertex to the next
      if (it.hasNext) v.addToAdj(it.head)
    }
  }

  private def buildLabelToVertexMap(controlFlowGraph: ControlFlowGraph): mutable.Map[Label, Node] = {
    val map = mutable.Map[Label, Node]()
    controlFlowGraph.nodes.foreach(v => {
      if (v.label.nonEmpty) map.put(v.label.get, v)
    })
    map
  }

  private def addInstructionsToCFG(items: mutable.Buffer[AssemblyItem], controlFlowGraph: ControlFlowGraph): Unit = {
    val it = items.iterator.buffered

    while (it.hasNext && it.head != null) {
      it.next() match {
        case Comment(_) =>
        case Directive(_) =>
        case label: Label => {
          val nxtInstruction = getNextInstruction(it)
          if (nxtInstruction.nonEmpty) {
            val v = Node(nxtInstruction.get)
            v.label = Some(label)

            // see if this instruction is also jumping / branching
            nxtInstruction.get match {
              case flow: Instruction.ControlFlow => {
                flow match {
                  case Instruction.BinaryBranch(opCode, src1, src2, label) => v.goToLabel = Some(label)
                  case Instruction.UnaryBranch(opCode, src, label) => v.goToLabel = Some(label)
                  case Instruction.Jump(opCode, label) => v.goToLabel = Some(label)
                  case Instruction.JumpRegister(opCode, address) =>
                }
              }
              case _ =>
            }

            controlFlowGraph.addNode(v)
          }

        }
        case instruction: Instruction => {
          instruction match {
            case flow: Instruction.ControlFlow => {
              flow match {
                case Instruction.BinaryBranch(_, _, _, label) => {
                  val v = Node(instruction)
                  v.goToLabel = Some(label)
                  controlFlowGraph.addNode(v)
                }
                case Instruction.UnaryBranch(_, _, label) => {
                  val v = Node(instruction)
                  v.goToLabel = Some(label)
                  controlFlowGraph.addNode(v)
                }
                case Instruction.Jump(_, label) => {
                  val v = Node(instruction)
                  v.goToLabel = Some(label)
                  controlFlowGraph.addNode(v)
                }
                case Instruction.JumpRegister(opCode, address) =>
              }
            }
            case _ => controlFlowGraph.addNode(Node(instruction))
          }
        }
      }
    }

  }

  private def getNextInstruction(it: BufferedIterator[AssemblyItem]): Option[Instruction] = {
    // loop until either the iterator has no more, or we reach an instruction
    while (it.hasNext && !it.head.isInstanceOf[Instruction]) {
      it.next()
    }

    // at this point either we have nothing left or the next element is an instruction
    if (it.hasNext) Some(it.next().asInstanceOf[Instruction]) else None
  }

  private def buildConflictGraph(nodeToLiveSets: mutable.Map[ControlFlowGraph.Node, (mutable.Set[Register], mutable.Set[Register])]): ConflictGraph = {
    val conflictGraph = ConflictGraph()
    // set of tuple with conflicting virtual registers (both live at same time)
    val vRegisterConflict = mutable.Set[mutable.Set[Register]]()

    // add conflicts
    nodeToLiveSets.values.foreach(liveset => {
      // if there's more than one register in the live-out or live-in set then those two (or N) conflict with each other
      if (liveset._1.size > 1) vRegisterConflict += liveset._1

      if (liveset._2.size > 1) vRegisterConflict += liveset._2
    })

    // add nodes to conflict graph
    nodeToLiveSets.keys.foreach(n => {
      val virtualRegs = n.instruction.uses().filter(_.isVirtual)
      if (n.instruction.define().nonEmpty && n.instruction.define().get.isVirtual) {
        virtualRegs += n.instruction.define().get
      }
      virtualRegs.foreach(vreg => conflictGraph.addNode(ConflictGraph.Node(vreg)))
    })

    // now go through set of sets containing live conflicts and create Nodes / edge

    // go through the nodes in graph and add all the edges where live-ness overlaps
    conflictGraph.nodes.foreach(n => {
      vRegisterConflict.filter(conflict => conflict.contains(n.vReg)).foreach(conflict => {
        conflict.filter(conflictReg => conflictReg != n.vReg).foreach(conflictReg => {
          n.addToAdj(conflictGraph.getOrCreateNode(conflictReg))
        })
      })
    })

    conflictGraph
  }


}
