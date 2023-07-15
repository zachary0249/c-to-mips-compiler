package gen.asm

import scala.collection.immutable

/**
 *
 * @author Zachary Hayden
 *         Date: 3/1/23
 */
sealed abstract class OpCode(val mnemonic: String) {
  override def toString: String = mnemonic

  /**
   * Gets the family of opcodes this opcode belongs to.
   *
   * @return An opcode kind.
   */
  def kind(): OpCode.Kind


}

object OpCode {
  sealed trait Kind

  /**
   * A type R opcode that takes three register operands.
   */
  case object TERNARY_ARITHMETIC extends Kind

  /**
   * A type R opcode that takes two register operands.
   */
  case object BINARY_ARITHMETIC extends Kind

  /**
   * A type R opcode that takes one register operand.
   */
  case object UNARY_ARITHMETIC extends Kind

  /**
   * An unconditional branch opcode.
   */
  case object JUMP extends Kind

  /**
   * An unconditional branch opcode that jumps to a register.
   */
  case object JUMP_REGISTER extends Kind

  /**
   * A branch opcode that takes two register operands and a label.
   */
  case object BINARY_BRANCH extends Kind

  /**
   * A branch opcode that takes on register operand and a label.
   */
  case object UNARY_BRANCH extends Kind

  /**
   * A binary arithmetic opcode that takes a destination register, a source register, and an immediate operand.
   */
  case object ARITHMETIC_WITH_IMMEDIATE extends Kind

  /**
   * A load opcode.
   */
  case object LOAD extends Kind

  /**
   * A store opcode.
   */
  case object STORE extends Kind

  /**
   * A load immediate opcode. This is an opcode that discards its source register.
   */
  case object LOAD_IMMEDIATE extends Kind

  /**
   * The load address pseudo-op.
   */
  case object LOAD_ADDRESS extends Kind

  /**
   * An opcode that takes no operands.
   */
  case object NULLARY extends Kind

  final class TernaryArithmetic(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = TERNARY_ARITHMETIC
  }

  final class BinaryArithmetic(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = BINARY_ARITHMETIC
  }

  final class UnaryArithmetic(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = UNARY_ARITHMETIC
  }

  final class ArithmeticWithImmediate(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = ARITHMETIC_WITH_IMMEDIATE
  }

  final class Nullary(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = NULLARY
  }

  final class Jump(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = JUMP
  }

  final class JumpRegister(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = JUMP_REGISTER
  }

  final class BinaryBranch(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = BINARY_BRANCH
  }

  final class UnaryBranch(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = UNARY_BRANCH
  }

  final class Load(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = LOAD
  }

  final class Store(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = STORE
  }

  final class LoadImmediate(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = LOAD_IMMEDIATE
  }

  final class LoadAddress(mnemonic: String) extends OpCode(mnemonic) {
    override def kind(): Kind = LOAD_ADDRESS
  }


  val ADD = new TernaryArithmetic("add")
  val ADDU = new TernaryArithmetic("addu")
  val AND = new TernaryArithmetic("and")
  val MOVN = new TernaryArithmetic("movn")
  val MOVZ = new TernaryArithmetic("movz")
  val MUL = new TernaryArithmetic("mul")
  val NOR = new TernaryArithmetic("nor")
  val OR = new TernaryArithmetic("or")
  val SLT = new TernaryArithmetic("slt")
  val SLTU = new TernaryArithmetic("sltu")
  val SLLV = new TernaryArithmetic("sllv")
  val SRLV = new TernaryArithmetic("srlv")
  val SRAV = new TernaryArithmetic("srav")
  val SUB = new TernaryArithmetic("sub")
  val SUBU = new TernaryArithmetic("subu")
  val XOR = new TernaryArithmetic("xor")

  /**
   * A list of all known ternary type R arithmetic opcodes.
   */
  val ternaryArithmeticOps: immutable.IndexedSeq[TernaryArithmetic] = Vector(ADD, ADDU, AND, NOR, OR, MUL, MOVN, MOVZ,
                                                                             SLT, SLTU, SLLV, SRLV, SRAV, SUB, SUBU,
                                                                             XOR)

  val DIV = new BinaryArithmetic("div")
  val DIVU = new BinaryArithmetic("divu")
  val MADD = new BinaryArithmetic("madd")
  val MADDU = new BinaryArithmetic("maddu")
  val MSUB = new BinaryArithmetic("msub")
  val MSUBU = new BinaryArithmetic("msubu")
  val MULT = new BinaryArithmetic("mult")
  val MULTU = new BinaryArithmetic("multu")

  /**
   * A list of all known binary type R arithmetic opcodes.
   */
  val binaryArithmeticOps: immutable.IndexedSeq[BinaryArithmetic] = Vector(DIV, DIVU, MADD, MADDU, MSUB, MSUBU, MULT,
                                                                           MULTU)

  val MFHI = new UnaryArithmetic("mfhi")
  val MFLO = new UnaryArithmetic("mflo")

  /**
   * A list of all known unary type R arithmetic opcodes.
   */
  val unaryArithmeticOps: immutable.IndexedSeq[UnaryArithmetic] = Vector(MFHI, MFLO)

  val ADDI = new ArithmeticWithImmediate("addi")
  val ADDIU = new ArithmeticWithImmediate("addiu")
  val ANDI = new ArithmeticWithImmediate("andi")
  val ORI = new ArithmeticWithImmediate("ori")
  val SLL = new ArithmeticWithImmediate("sll")
  val SRA = new ArithmeticWithImmediate("sra")
  val SRL = new ArithmeticWithImmediate("srl")
  val SLTI = new ArithmeticWithImmediate("slti")
  val SLTIU = new ArithmeticWithImmediate("sltiu")
  val XORI = new ArithmeticWithImmediate("xori")

  /**
   * A list of all known type I arithmetic opcodes.
   */
  val arithmeticWithImmediateOps: immutable.IndexedSeq[ArithmeticWithImmediate] = Vector(ADDI, ADDIU, ANDI, ORI, SLL,
                                                                                         SRA, SRL, SLTI, SLTIU, XORI)

  val BEQ = new BinaryBranch("beq")
  val BNE = new BinaryBranch("bne")

  /**
   * A list of all binary control flow opcodes.
   */
  val binaryBranchOps: immutable.IndexedSeq[BinaryBranch] = Vector(BEQ, BNE)

  val BEQZ = new UnaryBranch("beqz")
  val BGEZ = new UnaryBranch("bgez")
  val BGEZAL = new UnaryBranch("bgezal")
  val BGTZ = new UnaryBranch("bgtz")
  val BLEZ = new UnaryBranch("blez")
  val BLTZ = new UnaryBranch("bltz")
  val BLTZAL = new UnaryBranch("bltzal")
  val BNEZ = new UnaryBranch("bnez")

  /**
   * A list of all unary control flow opcodes.
   */
  val unaryBranchOps: immutable.IndexedSeq[UnaryBranch] = Vector(BEQZ, BGEZ, BGEZAL, BGTZ, BLEZ, BLTZ, BLTZAL, BNEZ)

  val B = new Jump("b")
  val BAL = new Jump("bal")
  val J = new Jump("j")
  val JAL = new Jump("jal")

  val JR = new JumpRegister("jr")
  val JALR = new JumpRegister("jalr")

  /**
   * A list of unconditional branch opcodes.
   */
  val jumpOps: immutable.IndexedSeq[Jump] = Vector(B, BAL, J, JAL)
  val jumpRegisterOps: immutable.IndexedSeq[JumpRegister] = Vector(JR, JALR)


  val NOP = new Nullary("nop")
  val PUSH_REGISTERS = new Nullary("pushRegisters")
  val POP_REGISTERS = new Nullary("popRegisters")
  val SYSCALL = new Nullary("syscall")

  /**
   * A list of all known nullary opcodes.
   */
  val nullaryOps: immutable.IndexedSeq[Nullary] = Vector(NOP, PUSH_REGISTERS, POP_REGISTERS, SYSCALL)

  val LB = new Load("lb")
  val LBU = new Load("lbu")
  val LH = new Load("lh")
  val LHU = new Load("lhu")
  val LW = new Load("lw")
  val LL = new Load("ll")
  val ULW = new Load("ulw")

  /**
   * A list of all known type I load opcodes.
   */
  val loadOps: immutable.IndexedSeq[Load] = Vector(LB, LBU, LH, LHU, LW, LL, ULW)

  val SB = new Store("sb")
  val SH = new Store("sh")
  val SW = new Store("sw")
  val SC = new Store("sc")
  val USW = new Store("usw")

  /**
   * A list of all known type I store opcodes.
   */
  val storeOps: immutable.IndexedSeq[Store] = Vector(SB, SH, SW, SC, USW)

  val LUI = new LoadImmediate("lui")
  val LI = new LoadImmediate("li")
  val LA = new LoadAddress("la")

  /**
   * Gets a list of all opcodes known to the compiler.
   */
  def allOps(): IndexedSeq[OpCode] = {
    Vector(
      ternaryArithmeticOps.map(x => x.asInstanceOf[OpCode]),
      binaryArithmeticOps.map((x) => x.asInstanceOf[OpCode]),
      unaryArithmeticOps.map((x) => x.asInstanceOf[OpCode]),
      arithmeticWithImmediateOps.map((x) => x.asInstanceOf[OpCode]),
      binaryBranchOps.map((x) => x.asInstanceOf[OpCode]),
      unaryBranchOps.map((x) => x.asInstanceOf[OpCode]),
      jumpOps.map((x) => x.asInstanceOf[OpCode]),
      jumpRegisterOps.map((x) => x.asInstanceOf[OpCode]),
      loadOps.map((x) => x.asInstanceOf[OpCode]),
      storeOps.map((x) => x.asInstanceOf[OpCode]),
      nullaryOps.map((x) => x.asInstanceOf[OpCode]),
      Vector(LUI, LI, LA, JR)
      ).flatten
  }

  def tryParse(mnemonic: String): Option[OpCode] = {
    allOps().find(x => x.mnemonic.equals(mnemonic))
  }

}