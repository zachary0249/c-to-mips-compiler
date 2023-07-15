package gen.asm

import java.util.Objects
import scala.collection.mutable
import scala.collection.mutable.Set

/**
 *
 * @author Zachary Hayden
 *         Date: 3/1/23
 */
sealed trait AssemblyItem

/**
 *
 * A comment in an assembly program. Comments do not change the meaning of programs, but may aid humans in their
 * understanding of programs.
 *
 * @param comment comment in assembly
 */
final case class Comment(comment: String) extends AssemblyItem {
  override def toString: String = "# " + comment
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// DIRECTIVE
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 *
 * @param name assembly directive
 */
final case class Directive(name: String) extends AssemblyItem {
  override def toString: String = "." + name
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// LABEL
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

final class Label private(var name: String) extends AssemblyItem {
  override def toString: String = name
}

object Label {
  // flyweight cache
  private val instances = mutable.Map.empty[String, Label]

  /**
   * Gets the unique label for a given name.
   *
   * @param name The label's name.
   * @return The unique {@link Label} instance with name {@code name}.
   */
  def get(name: String): Label = instances.getOrElseUpdate(name, new Label(name))

  /**
   * Creates a fresh label with a unique name.
   *
   * @param nameSuffix A suffix to append to the label's name.
   * @return A unique {@link Label} instance.
   */
  def create(nameSuffix: String): Label = {
    var counter = instances.size
    var draftName: String = null
    do {
      draftName = "label_" + counter + "_" + nameSuffix
      counter += 1
    } while (instances.contains(draftName))
    get(draftName)
  }

  /**
   * Creates a fresh label with a unique name.
   *
   * @return A unique {@link Label} instance.
   */
  def create(): Label = Label.create("")

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// INSTRUCTIONS
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

sealed trait Instruction extends AssemblyItem {
  val opCode: OpCode

  /**
   * @return optional register that this instructions modifies
   */
  def define(): Option[Register]

  /**
   * @return list of registers that this instruction uses
   */
  def uses(): mutable.Set[Register]

  /**
   *
   * @return list of registers that are used as operands for this instruction
   */
  def registers(): mutable.Set[Register] = {
    val regs = uses().map(identity)
    define() match {
      case Some(x) => regs += x
      case None =>
    }
    regs
  }

  /**
   * @param regMap replacement map for register
   * @return a new instruction where the registers have been replaced based on the regMap
   */
  def rebuild(regMap: mutable.Map[Register, Register]): Instruction


}

object Instruction {

  /**
   * A type R arithmetic instruction that takes three register arguments.
   */
  final case class TernaryArithmetic(opCode: OpCode.TernaryArithmetic, dst: Register, src1: Register,
                                     src2  : Register) extends Instruction {
    override def define(): Option[Register] = Some(dst)

    override def uses(): mutable.Set[Register] = mutable.Set(src1, src2)

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = {
      TernaryArithmetic(opCode, regMap.getOrElse(dst, dst), regMap.getOrElse(src1, src1),
                        regMap.getOrElse(src2, src2))
    }

    override def toString: String = opCode + " " + dst + "," + src1 + "," + src2
  }

  final case class BinaryArithmetic(opCode: OpCode.BinaryArithmetic, src1: Register, src2: Register) extends Instruction {

    override def define(): Option[Register] = None

    override def uses(): mutable.Set[Register] = mutable.Set(src1, src2)

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = {
      BinaryArithmetic(opCode, regMap.getOrElse(src1, src1), regMap.getOrElse(src2, src2))
    }

    override def toString: String = opCode + " " + src1 + "," + src2
  }

  /**
   * A type R arithmetic instruction that takes one register argument.
   */
  final case class UnaryArithmetic(opCode: OpCode.UnaryArithmetic, dst: Register) extends Instruction {
    override def define(): Option[Register] = Some(dst)

    override def uses(): mutable.Set[Register] = mutable.Set.empty

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = {
      UnaryArithmetic(opCode, regMap.getOrElse(dst, dst))
    }

    override def toString: String = opCode + " " + dst
  }

  /**
   * A core arithmetic instruction with two register operands and one immediate operand. This is a type I instruction.
   */
  final case class ArithmeticWithImmediate(opCode   : OpCode.ArithmeticWithImmediate,
                                           dst      : Register,
                                           src      : Register,
                                           immediate: Int) extends Instruction {
    override def define(): Option[Register] = Some(dst)

    override def uses(): mutable.Set[Register] = mutable.Set(src)

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = {
      ArithmeticWithImmediate(opCode, regMap.getOrElse(dst, dst), regMap.getOrElse(src, src), immediate)
    }

    override def toString: String = opCode + " " + dst + "," + src + "," + immediate
  }

  final case class LoadImmediate(opCode: OpCode.LoadImmediate, dst: Register, immediate: Int) extends Instruction {
    override def define(): Option[Register] = Some(dst)

    override def uses(): mutable.Set[Register] = mutable.Set.empty

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = {
      LoadImmediate(opCode, regMap.getOrElse(dst, dst), immediate)
    }

    override def toString: String = opCode + " " + dst + "," + immediate
  }

  final case class LoadAddress(dst: Register, label: Label) extends Instruction {
    override val opCode: OpCode = OpCode.LA

    override def define(): Option[Register] = Some(dst)

    override def uses(): mutable.Set[Register] = mutable.Set.empty

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = {
      LoadAddress(regMap.getOrElse(dst, dst), label)
    }

    override def toString: String = s"la $dst, $label"
  }

  /**
   * A nullary instruction, i.e., an instruction that takes no arguments. Use {@link # create ( OpCode.Nullary )} to
   * create nullary instructions, or use the pre-generated instructions in static fields {@link # nop},
   * {@link # pushRegisters}, and {@link # popRegisters}.
   */
  final case class Nullary private(opCode: OpCode.Nullary) extends Instruction {
    override def define(): Option[Register] = None

    override def uses(): mutable.Set[Register] = mutable.Set.empty

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = this

    override def toString: String = opCode.toString
  }

  object Nullary {
    /**
     * An instruction that performs no action.
     */
    val nop = Nullary(OpCode.NOP)

    /**
     * An intrinsic instruction that pushes onto the stack all registers currently in use by the compiler.
     */
    val pushRegisters = Nullary(OpCode.PUSH_REGISTERS)

    /**
     * An intrinsic instruction that pops from the stack all registers currently in use by the compiler.
     */
    val popRegisters = Nullary(OpCode.POP_REGISTERS)

    /**
     * An instruction that performs a system call.
     */
    val syscall = Nullary(OpCode.SYSCALL)

    /**
     * Creates a nullary instruction from an opcode.
     *
     * @param opcode The opcode to instantiate.
     * @return A nullary instruction for {@code opcode}.
     */
    def create(opcode: OpCode.Nullary): Nullary = if (opcode eq OpCode.NOP) nop
                                                  else if (opcode eq OpCode.PUSH_REGISTERS) pushRegisters
                                                       else if (opcode eq OpCode.POP_REGISTERS) popRegisters
                                                            else if (opcode eq OpCode.SYSCALL) syscall
                                                                 else throw new Error(
                                                                   "Cannot instantiate ill-understood opcode " + opcode)
  }

  /**
   * An instruction that affects control flow.
   */
  sealed trait ControlFlow extends Instruction

  /**
   * A binary branch instruction, that is, a type I instruction that takes two {@link Register} operands and one
   * {@link Label} as immediate operand.
   */
  final case class BinaryBranch(opCode: OpCode.BinaryBranch,
                                src1  : Register,
                                src2  : Register,
                                label : Label) extends ControlFlow {

    override def define(): Option[Register] = None

    override def uses(): mutable.Set[Register] = mutable.Set(src1, src2)

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = BinaryBranch(opCode, regMap
      .getOrElse(src1, src1), regMap.getOrElse(src2, src2), label)

    override def toString: String = opCode + " " + src1 + "," + src2 + "," + label
  }

  /**
   * A unary branch instruction, that is, an instruction that takes one {@link Register} operand and one
   * {@link Label} as immediate operand.
   */
  final case class UnaryBranch(opCode: OpCode.UnaryBranch, src: Register, label: Label) extends ControlFlow {
    override def define(): Option[Register] = None

    override def uses(): mutable.Set[Register] = mutable.Set(src)

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = UnaryBranch(opCode,
                                                                                             regMap.getOrElse(src, src),
                                                                                             label)

    override def toString: String = opCode + " " + src + "," + label
  }

  /**
   * A jump instruction, an unconditional branch that consists of an opcode and an address operand, encoded as a
   * {@link Label}.
   */
  final case class Jump(opCode: OpCode.Jump, label: Label) extends ControlFlow {
    override def define(): Option[Register] = None

    override def uses(): mutable.Set[Register] = mutable.Set.empty

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = this

    override def toString: String = opCode + " " + label
  }

  /**
   * A jump-register instruction, an unconditional branch that jumps to the address defined by a {@link Register}
   * operand.
   */
  final case class JumpRegister(opCode: OpCode.JumpRegister, address: Register) extends ControlFlow {
    override def define(): Option[Register] = None

    override def uses(): mutable.Set[Register] = mutable.Set(address)

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = {
      JumpRegister(opCode, regMap.getOrElse(address, address))
    }

    override def toString: String = opCode + " " + address
  }


  /**
   * An instruction that loads or stores an address in memory. The address is computed based on a register and an
   * immediate operand.
   */
  sealed trait MemIndirect extends Instruction {
    val op1: Register
    val op2: Register
    val immediate: Int

    override def toString: String = opCode + " " + op1 + "," + immediate + "(" + op2 + ")"

    override def equals(o: Any): Boolean = {
      o match {
        case memIndirect: MemIndirect => {
          if (op1 == memIndirect.op1 && op2 == memIndirect.op2 && immediate == memIndirect.immediate) true
          else false
        }
        case _ => false
      }
    }

    override def hashCode: Int = Objects.hash(opCode, op1, op2) + immediate
  }

  final case class Store(val opCode   : OpCode.Store,
                    val op1      : Register,
                    val op2      : Register,
                    val immediate: Int) extends MemIndirect {
    override def define(): Option[Register] = None

    override def uses(): mutable.Set[Register] = mutable.Set(op1, op2)

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = {
      new Store(opCode, regMap.getOrElse(op1, op1), regMap.getOrElse(op2, op2), immediate)
    }

  }

  final class Load(val opCode   : OpCode.Load,
                   val op1      : Register,
                   val op2      : Register,
                   val immediate: Int) extends MemIndirect {
    override def define(): Option[Register] = Some(op1)

    override def uses(): mutable.Set[Register] = mutable.Set(op2)

    override def rebuild(regMap: mutable.Map[Register, Register]): Instruction = {
      new Load(opCode, regMap.getOrElse(op1, op1), regMap.getOrElse(op2, op2), immediate)
    }
  }
}