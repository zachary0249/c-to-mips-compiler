package gen.asm

import gen.asm.AssemblyProgram.Section.SectionType.SectionType

import java.io.{PrintWriter, StringWriter}
import java.util.Objects
import scala.collection.mutable.ArrayBuffer
// Authors: Jonathan Van der Cruysse, Christophe Dubach

// DO NOT MODIFY THIS FILE. For technical grading reasons, we may roll back this file to the original version we
// provided. This will overwrite any and all local changes you made, likely breaking your compiler if you made
// changes.
//
// Open a question on Ed if you need additional features that the classes in this file do not support, such as an
// instruction/opcode that is essential but not currently exposed.


/**
 * A MIPS assembly program.
 */
object AssemblyProgram {
  /**
   * A section of an assembly program.
   */
  object Section {
    /**
     * An enumeration of section types.
     */
    object SectionType extends Enumeration {
      type SectionType = Value
      val TEXT, DATA = Value
    }
  }

  final class Section(val sectionType: SectionType) {

    /**
     * A list of the assembly items in this section.
     */
    val items: ArrayBuffer[AssemblyItem] = ArrayBuffer.empty

    def emit(instruction: Instruction): Unit = {
      assert(this.sectionType eq Section.SectionType.TEXT)
      items += instruction
    }

    def emit(opcode: OpCode.TernaryArithmetic, dst: Register, src1: Register, src2: Register): Unit = {
      emit(new Instruction.TernaryArithmetic(opcode, dst, src1, src2))
    }

    def emit(opcode: OpCode.BinaryArithmetic, src1: Register, src2: Register): Unit = {
      emit(new Instruction.BinaryArithmetic(opcode, src1, src2))
    }

    def emit(opcode: OpCode.UnaryArithmetic, dst: Register): Unit = {
      emit(new Instruction.UnaryArithmetic(opcode, dst))
    }

    def emit(opcode: OpCode.BinaryBranch, src1: Register, src2: Register, label: Label): Unit = {
      emit(new Instruction.BinaryBranch(opcode, src1, src2, label))
    }

    def emit(opcode: OpCode.UnaryBranch, src: Register, label: Label): Unit = {
      emit(new Instruction.UnaryBranch(opcode, src, label))
    }

    def emit(opcode: OpCode.Jump, label: Label): Unit = {
      emit(new Instruction.Jump(opcode, label))
    }

    def emit(opcode: OpCode.JumpRegister, address: Register): Unit = {
      emit(new Instruction.JumpRegister(opcode, address))
    }

    def emit(opcode: OpCode.ArithmeticWithImmediate, dst: Register, src: Register, imm: Int): Unit = {
      emit(Instruction.ArithmeticWithImmediate(opcode, dst, src, imm))
    }

    def emit(ignoredOpcode: OpCode.LoadAddress, dst: Register, label: Label): Unit = {
      emit(Instruction.LoadAddress(dst, label))
    }

    def emit(opcode: OpCode.LoadImmediate, dst: Register, immediate: Int): Unit = {
      emit(Instruction.LoadImmediate(opcode, dst, immediate))
    }

    def emit(opcode: OpCode.Load, `val`: Register, addr: Register, imm: Int): Unit = {
      emit(new Instruction.Load(opcode, `val`, addr, imm))
    }

    def emit(opcode: OpCode.Store, `val`: Register, addr: Register, imm: Int): Unit = {
      emit(Instruction.Store(opcode, `val`, addr, imm))
    }

    def emit(opcode: OpCode.Nullary): Unit = {
      emit(Instruction.Nullary.create(opcode))
    }

    def emit(label: Label): Unit = {
      items += label
    }



    def emit(comment: Comment): Unit = {
      items += comment
    }

    def emit(comment: String): Unit = {
      items += Comment(comment)
    }

    def emit(directive: Directive): Unit = {
      items += directive
    }

    def emit(label: Label, directive: Directive): Unit = {
      emit(label)
      emit(directive)
    }

    def print(writer: PrintWriter): Unit = {
      var isDataSection = false
      sectionType match {
        case Section.SectionType.DATA => writer.println(".data"); isDataSection = true
        case Section.SectionType.TEXT => writer.println(".text")
      }
      items.foreach {
        case comment: Comment => writer.println(comment)
        case directive: Directive => writer.println(directive)
        // all labels should have colon following
        case label: Label => writer.println(label + ":")
        case instruction: Instruction => writer.println(instruction)
        // if we get here problems occurred
        case wtf => System.err.println("Found unexpected assembly item: " + wtf); throw new IllegalStateException()
      }
    }

    override def toString: String = {
      val sw = new StringWriter
      val pw = new PrintWriter(sw)
      print(pw)
      sw.toString
    }

    override def equals(o: Any): Boolean = {
      o match {
        case section: Section => section.sectionType == sectionType && items.equals(section.items)
        case _ => false
      }
    }

    override def hashCode: Int = Objects.hash(sectionType, items)
  }
}

final class AssemblyProgram {
  private var currSection: AssemblyProgram.Section = null
  val sections: ArrayBuffer[AssemblyProgram.Section] = ArrayBuffer.empty

  /**
   * Gets the current section. That is, the section that was last added to this {@link AssemblyProgram}.
   *
   * @return This program's current section.
   */
  def getCurrentSection: AssemblyProgram.Section = currSection

  /**
   * Appends a given section to this program. The section will become the current section, as produced by
   * {@link getCurrentSection ( )}.
   *
   * @param section The section to append to this program.
   */
  def emitSection(section: AssemblyProgram.Section): Unit = {
    currSection = section
    sections += currSection
  }

  /**
   * Creates a new section and appends it to this program. The new section will become the current section, as
   * produced by {@link # getCurrentSection ( )}.
   *
   * @param type The type of section to create.
   * @return The newly created section.
   */
  def newSection(sectionType: SectionType): AssemblyProgram.Section = {
    val section = new AssemblyProgram.Section(sectionType)
    emitSection(section)
    getCurrentSection
  }

  /**
   * Sends a textual representation of this assembly program to a {@link PrintWriter}.
   *
   * @param writer The writer to send a textual version of this program to.
   */
  def print(writer: PrintWriter): Unit = {
    sections.foreach((section: AssemblyProgram.Section) => {
      section.print(writer)
      writer.println()

    })
    writer.close()
  }

  override def equals(o: Any): Boolean = {
    o match {
      case asm: AssemblyProgram => sections.equals(asm.sections)
      case _ => false
    }
  }

  override def hashCode: Int = Objects.hash(sections)
}
