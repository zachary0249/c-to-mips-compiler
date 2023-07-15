package gen.asm

import gen.asm.OpCode._

import java.util.function.IntPredicate
import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer
import scala.io.BufferedSource

/**
 *
 *
 */

/**
 * @author Zachary Hayden
 *         Date: 3/6/23
 */
object AssemblyParser {
  /**
   * Reads a MIPS assembly program from a buffered reader.
   *
   * @param reader A buffered reader that reads from a textual MIPS assembly program.
   * @return An {@link AssemblyProgram} instance that corresponds to the text being read by {@code reader}.
   */
  def readAssemblyProgram(reader: BufferedSource): AssemblyProgram = {
    val textDirective = Directive("text")
    val dataDirective = Directive("data")
    val program = new AssemblyProgram()
    var currentSection: AssemblyProgram.Section = null
    for (line: String <- reader.getLines()) {
      val item = parseAssemblyItem(line)
      if (item != null) {
        if (item.equals(textDirective) || item.equals(dataDirective)) {
          if (currentSection != null) program.emitSection(currentSection)
          currentSection = new AssemblyProgram.Section(
            if (item.equals(dataDirective)) AssemblyProgram.Section.SectionType.DATA
            else AssemblyProgram.Section.SectionType.TEXT)
        }
        else {
          if (currentSection == null) currentSection = new AssemblyProgram.Section(
            AssemblyProgram.Section.SectionType.TEXT)
          currentSection.items += item
        }
      }
    }

    if (currentSection != null) program.emitSection(currentSection)

    program
  }

  /**
   * Parses a string as an {@link AssemblyItem}.
   *
   * @param line A single line of MIPS assembly.
   * @return An assembly item if the line is nonempty; otherwise, {@code null}.
   */
  def parseAssemblyItem(pLine: String): AssemblyItem = {
    // Check if the line looks promising.
    if (pLine == null || pLine.isBlank) return null
    // Trim the line if it looks like an assembly item.
    val line = pLine.trim
    if (line.startsWith("#")) {
      // Comments start with a hashtag.
      Comment(line.substring(1).trim)
    }
    else if (line.startsWith(".")) {
      // Directives start with a dot.
      Directive(line.substring(1))
    } else if (line.endsWith(":")) {
      // Label definitions end with a colon and must be identifiers.
      val labelIdentifier = line.substring(0, line.length - 1)
      if (!isLabel(labelIdentifier)) throw new Error("Expected a label identifier; found " + labelIdentifier)
      Label.get(labelIdentifier)
    } else {
      // Anything else must be an instruction. The general format for instructions is `opcode arg1, arg2, ...`.
      var opcodeAndArgs = line.split(" ", 2)
      if (opcodeAndArgs.length > 2) throw new Error("Expected an instruction; found " + line)
      else if (opcodeAndArgs.length == 1) opcodeAndArgs = Array[String](opcodeAndArgs(0), "")

      // Split and parse the arguments.
      var args = opcodeAndArgs(1).split(",").map(s => s.trim).toBuffer
      if ((args.size == 1) && args.head.isBlank) args = ArrayBuffer.empty

      // We now branch based on the opcode.
      val op = OpCode.tryParse(opcodeAndArgs(0).trim)
      if (op.isEmpty) throw new Error("Ill-understood opcode " + opcodeAndArgs(0).trim)

      val opcode = op.get
      opcode.kind() match {
        case LOAD_ADDRESS => {
          checkArity(args, 2, line)
          Instruction.LoadAddress(parseRegister(args.head), parseLabel(args(1)))
        }
        case TERNARY_ARITHMETIC => {
          checkArity(args, 3, line)
          Instruction.TernaryArithmetic(opcode.asInstanceOf[OpCode.TernaryArithmetic], parseRegister(args.head),
                                        parseRegister(args(1)),
                                        parseRegister(args(2)))
        }
        case BINARY_ARITHMETIC => {
          checkArity(args, 2, line)
          Instruction.BinaryArithmetic(opcode.asInstanceOf[OpCode.BinaryArithmetic], parseRegister(args.head),
                                       parseRegister(args(1)))
        }
        case UNARY_ARITHMETIC => {
          checkArity(args, 1, line)
          Instruction.UnaryArithmetic(opcode.asInstanceOf[OpCode.UnaryArithmetic], parseRegister(args.head))
        }
        case JUMP => {
          checkArity(args, 1, line)
          Instruction.Jump(opcode.asInstanceOf[OpCode.Jump], parseLabel(args.head))
        }
        case JUMP_REGISTER => {
          checkArity(args, 1, line)
          Instruction.JumpRegister(opcode.asInstanceOf[OpCode.JumpRegister], parseRegister(args.head))
        }
        case BINARY_BRANCH => {
          checkArity(args, 3, line)
          Instruction.BinaryBranch(opcode.asInstanceOf[OpCode.BinaryBranch], parseRegister(args.head),
                                   parseRegister(args(1)),
                                   parseLabel(args(2)))
        }
        case UNARY_BRANCH => {
          checkArity(args, 2, line)
          Instruction.UnaryBranch(opcode.asInstanceOf[OpCode.UnaryBranch], parseRegister(args.head),
                                  parseLabel(args(1)))
        }
        case ARITHMETIC_WITH_IMMEDIATE => {
          checkArity(args, 3, line)
          Instruction
            .ArithmeticWithImmediate(opcode.asInstanceOf[OpCode.ArithmeticWithImmediate], parseRegister(args.head),
                                     parseRegister(args(1)),
                                     parseImmediate(args(2)))
        }
        case LOAD => {
          checkArity(args, 2, line)
          val memOperand = parseMemoryOperand(args(1))
          new Instruction.Load(opcode.asInstanceOf[OpCode.Load], parseRegister(args.head), memOperand._1,
                               memOperand._2)
        }
        case STORE => {
          checkArity(args, 2, line)
          val memOperand = parseMemoryOperand(args(1))
          Instruction.Store(opcode.asInstanceOf[OpCode.Store], parseRegister(args.head), memOperand._1,
                            memOperand._2)
        }
        case LOAD_IMMEDIATE => {
          checkArity(args, 2, line)
          Instruction.LoadImmediate(opcode.asInstanceOf[OpCode.LoadImmediate], parseRegister(args.head),
                                    parseImmediate(args(1)))
        }
        case NULLARY => {
          checkArity(args, 0, line)
          return Instruction.Nullary.create(opcode.asInstanceOf[OpCode.Nullary])
        }
        case _ => throw new Error("Cannot parse ill-understood instruction " + line)
      }
    }
  }

  private def checkArity(args: mutable.Buffer[String], expectedArity: Int, line: String): Unit = {
    if (args.size != expectedArity) throw new Error(
      "The expected number of arguments was " + expectedArity + "; got " + args.size + ": " + line)
  }

  private def parseRegister(name: String) = {
    if (!name.codePoints().allMatch(new IntPredicate {
      override def test(value: Int): Boolean = Character.isJavaIdentifierPart(value)
    })) {
      throw new Error("Expected a register name, got " + name)
    }
    if (name.startsWith("$")) {
      // We found an architectural register.
      val candidate = Register.Arch.allRegisters.find(r => r.toString.equals(name))
      if (candidate.isEmpty) throw new Error("Expected an architectural register name, got " + name)
      candidate.get
    }
    else {
      // Looks we just ran into a virtual register.
      Register.Virtual.get(name)
    }
  }

  private def parseLabel(name: String) = {
    if (!isLabel(name)) throw new Error("Expected a label, got " + name)
    Label.get(name)
  }

  private def isLabel(text: String) = text.nonEmpty && Character.isJavaIdentifierStart(text.codePointAt(0)) && text
    .codePoints.allMatch(new IntPredicate {
    override def test(value: Int): Boolean = Character.isJavaIdentifierPart(value)
  })

  private def parseImmediate(text: String) = text.toInt

  private def parseMemoryOperand(text: String): (Register, Int) = {
    if (text.startsWith("(")) {
      // If a memory operand starts with a parenthesis, then it must be an offset-free operand. That is, it must
      // have an offset of zero.
      if (text.charAt(text.length - 1) != ')') throw new Error("Expected a memory operand, got " + text)
      val register = parseRegister(text.substring(1, text.length - 1))
      register -> 0
    }
    val pieces = text.split("\\(", 2)
    if (pieces.length != 2 || pieces(1).charAt(pieces(1).length - 1) != ')') throw new Error(
      "Expected a memory operand, got " + text)

    val immediate = parseImmediate(pieces(0))
    val register = parseRegister(pieces(1).substring(0, pieces(1).length - 1))
    register -> immediate
  }
}


