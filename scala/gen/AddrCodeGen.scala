package gen

import ast._
import gen.asm.{AssemblyProgram, OpCode, Register}

/**
 *
 * @author Zachary Hayden
 *         Date: 3/6/23
 */
final case class AddrCodeGen(asmProg: AssemblyProgram) extends CodeGen {
  private val section = asmProg.getCurrentSection

  def visit(e: Expr): Option[Register] = {
    e match {
      case SizeOfExpr(typeSize) => None
      case classInstantiationExpr: ClassInstantiationExpr => {
        None
      }
      case assign: Assign => {
        val lhsAddrReg = visit(assign.lhs)
        assign.t match {
          case classType: ClassType if (assign.rhs.isInstanceOf[ClassInstantiationExpr]) => None
          case classType: ClassType if (!assign.rhs.isInstanceOf[ClassInstantiationExpr]) => {
            val rhsAddrReg = visit(assign.rhs)
            // copy the class object structure value by value
            val resReg = Register.Virtual.create()

            // copy the virtual table pointer over
            section.emit(OpCode.LA, resReg, classType.classDecl.classType.label.get)
            section.emit(OpCode.SW, resReg, lhsAddrReg.get, 0)

            classType.classDecl.varDecls.foreach(vd => {
              // get the field to copy into register
              section.emit(OpCode.LW, resReg, rhsAddrReg.get, classType.classDecl.classType.varOffsetMap(vd))
              // store the field at the same memory address (including offset) to the lhs expression (class)
              section.emit(OpCode.SW, resReg, lhsAddrReg.get, classType.classDecl.classType.varOffsetMap(vd))
            })
          }
          case structType: StructType => {
            val rhsAddrReg = visit(assign.rhs)
            // copy the struct value by value
            val resReg = Register.Virtual.create()
            structType.structDecl.varDecls.foreach(vd => {
              // get the field to copy into register
               section.emit(OpCode.LW, resReg, rhsAddrReg.get, structType.structDecl.structType.varOffsetMap(vd))
              // store the field at the same memory address (including offset) to lhs expr (struct)
              section.emit(OpCode.SW, resReg, lhsAddrReg.get, structType.structDecl.structType.varOffsetMap(vd))
            })
          }
          case _ => {
            // not a struct
            val rhsReg = new ExprCodeGen(asmProg).visit(assign.rhs)
            // copy value of rhs into memory at lhs address
            section.emit(MemAllocCodeGen.storeOpCodeFromType(assign.t), rhsReg, lhsAddrReg.get, 0)
          }
        }
        lhsAddrReg
      }
      case AddressofExpr(expr) => {
        visit(expr)
      }
      case IntLiteral(x) => None
      case ChrLiteral(c) => None
      case strLiteral: StrLiteral => {
        val resReg = Register.Virtual.create()
        section.emit(OpCode.LA,  resReg, strLiteral.label)
        Some(resReg)
      }
      case varExpr: VarExpr => {
        val resReg = Register.Virtual.create()
        // checking if statically allocated (global variable)
        if (MemAllocCodeGen.isStaticAlloc(varExpr.varDecl)) {
          section.emit(OpCode.LA, resReg, varExpr.varDecl.label.get)
        } else if (MemAllocCodeGen.isDynamicAlloc(varExpr.varDecl)) {
          section.emit(OpCode.ADDI, resReg, Register.Arch.fp, varExpr.varDecl.fpOffset.get)
        }
//               else {
//          System.err.println("unexpected var expr found without var decl label or fpOffset")
//          throw new RuntimeException()
//        }

        Some(resReg)
      }
      case FunCallExpr(name, args) => None
      case op: Op => None
      case BinOp(lhs, op, rhs) => None
      case ArrayAccessExpr(arr, index) => {
        // address of array + index
        val arrAddr = visit(arr)
        // addi $t0, $t0, sizeof(arr)*index
        val resReg = Register.Virtual.create()
        val ixReg = new ExprCodeGen(asmProg).visit(index)
        section.emit(OpCode.LI, resReg, MemAllocCodeGen.sizeOfElem(arr.t))
        section.emit(OpCode.MUL, ixReg, resReg, ixReg)
        section.emit(OpCode.ADD, arrAddr.get, arrAddr.get, ixReg)// TODO: implement assignment to evaluate for this)
        arrAddr
      }
      case FieldAccessExpr(structure, name) => {

        val fieldOffset = ExprCodeGen.extractFieldOffset(structure, name)
        val structAddr = visit(structure)
        // result will be the sum of the base struct address and the offset for the specific field
        section.emit(OpCode.ADDI, structAddr.get, structAddr.get, fieldOffset)
        structAddr
      }
      case TypecastExpr(castType, expr) => {
        visit(expr)
      }
      case ValueAtExpr(expr) => visit(expr)
    }
  }

}
