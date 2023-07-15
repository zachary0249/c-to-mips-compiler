package gen

import ast._
import gen.ExprCodeGen.getVarExprFromClassExpr
import gen.asm._

import scala.collection.mutable

/**
 *
 * @author Zachary Hayden
 *         Date: 3/8/23
 */
class ExprCodeGen(val asmProg: AssemblyProgram) extends CodeGen {
  private val section: AssemblyProgram.Section = asmProg.getCurrentSection
  private val addrCodeGen = AddrCodeGen(asmProg)

  def visit(e: Expr): Register = {

    // handling for special case of struct-type : return address and AddrCodeGen will handle the assignment etc
    e.t match {
      case StructType(_) => return addrCodeGen.visit(e).get
      case _ =>
    }

    e match {
      case SizeOfExpr(typeSize) => {
        // get the size of the type
        val size = {
          if (typeSize.isInstanceOf[ClassType]) {
            4
          }else MemAllocCodeGen.sizeOf(typeSize)
        }
        // put the size into register
        val resReg = Register.Virtual.create()
        section.emit(OpCode.LI, resReg, size)
        resReg
      }
      case assign: Assign => {
//        val addrReg = addrCodeGen.visit(lhs).get
//        val rhsReg = visit(rhs)
//        // cannot store something that is larger than the thing in which it's being stored in
//        section.emit(MemAllocCodeGen.storeOpCodeFromType(lhs.t), rhsReg, addrReg, 0)
//        // return rhsReg : contains the value of the assign
//        rhsReg
        val resReg = addrCodeGen.visit(assign).get
        section.emit(OpCode.LW, resReg, resReg, 0)
        resReg
      }
      case AddressofExpr(expr) => {
        addrCodeGen.visit(expr).get
      }
      case IntLiteral(x) => {
        val resReg = Register.Virtual.create()
        section.emit(OpCode.LI, resReg, x)
        resReg
      }
      case ChrLiteral(c) => {
        val resReg = Register.Virtual.create()
        section.emit(OpCode.LI, resReg, c)
        resReg
      }
      case strLiteral: StrLiteral => {
        // 1. load address of str from label
        val resReg = Register.Virtual.create()
        section.emit(OpCode.LA, resReg, strLiteral.label)
        resReg

      }
      case varExpr: VarExpr => {
//        if (varExpr.varDecl.fieldOf.nonEmpty) {
//          val field = FieldAccessExpr(varExpr, varExpr.name)
//          field.classDecl = varExpr.varDecl.fieldOf
//          visit(field)
//        }

        // if global variable
        if (varExpr.varDecl.label.nonEmpty) {
          val resReg = Register.Virtual.create()
          val loadOp = MemAllocCodeGen.loadOpCodeFromType(varExpr.t)
          section.emit(OpCode.LA, resReg, varExpr.varDecl.label.get)
          section.emit(loadOp, resReg, resReg, 0)
          resReg
        } else if (varExpr.varDecl.fpOffset.nonEmpty) { // local variable
          val resReg = Register.Virtual.create()
          val loadOp = MemAllocCodeGen.loadOpCodeFromType(varExpr.t)
          section.emit(loadOp, resReg, Register.Arch.fp, varExpr.varDecl.fpOffset.get) // TODO: check / test
          resReg
        } else {
          System.err.println("Var expression found with var decl that has neither a label nor an fpOffset: " + varExpr)
          throw new RuntimeException()
        }
      }
      case funCallExpr: FunCallExpr => {

        //emit pre-call instructions: pass args via stack, [opt] reserve space on stack for return val, push return addr
        var stackOffset = 0
        funCallExpr.args.foreach(expr => {
          // TODO: if struct needs to be passed by value
          // get register of arg -> decrement sp -> store arg on stack
          val exprReg = visit(expr)
          val exprSz = MemAllocCodeGen.sizeOf(expr.t)
          section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -exprSz)
          stackOffset += exprSz
          section.emit(OpCode.SW, exprReg, Register.Arch.sp, 0)
        })

        // save space for return value (if it exists)
        if (funCallExpr.t != BaseType.VOID) {
          val returnSz = MemAllocCodeGen.sizeOf(funCallExpr.t)
          section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -returnSz)
          stackOffset += returnSz // incrementing to keep track of how many bytes the sp needs to be restored by
        }

        // push return address
        val ptrSz = 4
        section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -ptrSz)
        stackOffset += ptrSz
        section.emit(OpCode.SW, Register.Arch.ra, Register.Arch.sp, 0)

        // call the function
        section.emit(OpCode.JAL, funCallExpr.funDecl.label)

        // emit post call

        // restore return address register
        section.emit(OpCode.LW, Register.Arch.ra, Register.Arch.sp, 0)

        // read return value (if it exists)
        var resReg: Register.Virtual = null
        if (funCallExpr.t != BaseType.VOID) {
          // if return is struct type -> it'll have been loaded onto the stack as its address
          // so just read its address (ptr = 4 bytes = LW)

          resReg = Register.Virtual.create()
          section.emit(MemAllocCodeGen.loadOpCodeFromType(funCallExpr.t), resReg, Register.Arch.sp,
                       MemAllocCodeGen.sizeOf(funCallExpr.t))
        }

        // reset the stack pointer
        section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, stackOffset)
        resReg // return the return value register or null if no return from function call

      }
      case classFunCallExpr: ClassFunCallExpr => {
        //emit pre-call instructions: pass args via stack, [opt] reserve space on stack for return val, push return addr
        var stackOffset = 0
        classFunCallExpr.funCallExpr.args.foreach(expr => {
          // TODO: if struct needs to be passed by value
          // get register of arg -> decrement sp -> store arg on stack
          val exprReg = visit(expr)
          val exprSz = MemAllocCodeGen.sizeOf(expr.t)
          section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -exprSz)
          stackOffset += exprSz
          section.emit(OpCode.SW, exprReg, Register.Arch.sp, 0)
        })

        // save space for return value (if it exists)
        if (classFunCallExpr.funCallExpr.t != BaseType.VOID) {
          val returnSz = MemAllocCodeGen.sizeOf(classFunCallExpr.funCallExpr.t)
          section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -returnSz)
          stackOffset += returnSz // incrementing to keep track of how many bytes the sp needs to be restored by
        }

        // push return address
        val ptrSz = 4
        section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -ptrSz)
        stackOffset += ptrSz
        section.emit(OpCode.SW, Register.Arch.ra, Register.Arch.sp, 0)

        // call the function
        val tmpReg = Register.Virtual.create()
        section.emit(OpCode.LA, tmpReg, classFunCallExpr.funCallExpr.funDecl.label)
        section.emit(OpCode.JALR, tmpReg)

        // emit post call

        // restore return address register
        section.emit(OpCode.LW, Register.Arch.ra, Register.Arch.sp, 0)

        // read return value (if it exists)
        var resReg: Register.Virtual = null
        if (classFunCallExpr.funCallExpr.t != BaseType.VOID) {
          // if return is struct type -> it'll have been loaded onto the stack as its address
          // so just read its address (ptr = 4 bytes = LW)

          resReg = Register.Virtual.create()
          section.emit(MemAllocCodeGen.loadOpCodeFromType(classFunCallExpr.funCallExpr.t), resReg, Register.Arch.sp,
                       MemAllocCodeGen.sizeOf(classFunCallExpr.funCallExpr.t))
        }

        // reset the stack pointer
        section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, stackOffset)
        resReg // return the return value register or null if no return from function call

//        val clsAddr = addrCodeGen.visit(classFunCallExpr.classExpr)
//        val clsVarExpr = getVarExprFromClassExpr(classFunCallExpr.classExpr).get
//        val fnLabel = clsVarExpr.varDecl.asInstanceOf[ClassType].virtualTable(classFunCallExpr.funCallExpr.name)
//
//        val resReg = Register.Virtual.create()
//        section.emit(OpCode.LA, resReg, fnLabel)

      }

      case classInstantiationExpr: ClassInstantiationExpr => {
//        val resReg = Register.Virtual.create()
//        section.emit(OpCode.LA, resReg, classInstantiationExpr.classType.label.get)
//        resReg
        null
      }
      case op: Op => null
      case BinOp(lhs, op, rhs) => {
        val lhsReg = visit(lhs)
        val resReg = Register.Virtual.create()

        op match {
          case ADD => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.ADD, resReg, lhsReg, rhsReg)
          }
          case SUB => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.SUB, resReg, lhsReg, rhsReg)
          }
          case MUL => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.MUL, resReg, lhsReg, rhsReg)
          }
          case DIV => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.DIV, lhsReg, rhsReg)
            section.emit(OpCode.MFLO, resReg) // get int division quotient from lo
          }
          case MOD => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.DIV, lhsReg, rhsReg)
            section.emit(OpCode.MFHI, resReg) // get int division remainder from hi
          }
          case GT => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.SLT, resReg, rhsReg, lhsReg)
          }
          case LT => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.SLT, resReg, lhsReg, rhsReg)
          }
          case GE => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.SLT, resReg, lhsReg, rhsReg)
            section.emit(OpCode.XORI, resReg, resReg, 0x1) // logical negation -> x >= y <=> !(x < y)
          }
          case LE => {
            // logical negation of greater than
            val rhsReg = visit(rhs)
            section.emit(OpCode.SLT, resReg, rhsReg, lhsReg)
            section.emit(OpCode.XORI, resReg, resReg, 0x1)
          }
          case NE => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.XOR, resReg, lhsReg, rhsReg) // which bit different
            section.emit(OpCode.SLTU, resReg, Register.Arch.zero, resReg) // diff if 0 <
          }
          case EQ => {
            val rhsReg = visit(rhs)
            section.emit(OpCode.XOR, resReg, lhsReg, rhsReg) // which bits are different
            section.emit(OpCode.SLTIU, resReg, resReg, 1) // if 0 (no diff) flip to 1 else 0
          }
          case OR => {
            val trueLbl = Label.create()
            val endLbl = Label.create()
            section.emit(OpCode.BNEZ, lhsReg, trueLbl)

            val rhsReg = visit(rhs)
            section.emit(OpCode.BNEZ, rhsReg, trueLbl)

            section.emit(OpCode.LI, resReg, 0)
            section.emit(OpCode.J, endLbl)

            section.emit(trueLbl)
            section.emit(OpCode.LI, resReg, 1)

            section.emit(endLbl)

          }
          case AND => {
            // create labels
            val endLbl = Label.create()

            section.emit(OpCode.LI, resReg, 0)
            // if either args are 0 then break else true
            section.emit(OpCode.BEQZ, lhsReg, endLbl)
            val rhsReg = visit(rhs)
            section.emit(OpCode.BEQZ, rhsReg, endLbl)

            // if we get here we know both args are true (1)
            section.emit(OpCode.LI, resReg, 1)

            section.emit(endLbl)
          }
        }

        resReg
      }
      case ArrayAccessExpr(arr, index) => {
        // get address of array
        val arrAddrRegOpt = addrCodeGen.visit(arr)
        // handle exception
        if (arrAddrRegOpt.isEmpty) {
          System.err.println("unexpected empty option")
          throw new RuntimeException()
        }
        val arrAddrReg = arrAddrRegOpt.get

        // add to the address the sizeof(arr_value) * index
        // calculate index := sizeof(arr_value) * index
        val arrayElemSz = MemAllocCodeGen.sizeOfElem(arr.t)

        // get array index into register
        val arrayElemSzReg = Register.Virtual.create()
        section.emit(OpCode.LI, arrayElemSzReg, arrayElemSz)

        section.emit(OpCode.MUL, arrayElemSzReg, arrayElemSzReg, visit(index))

        // load the exact address into register via mul
        //        val indexSzReg = Register.Virtual.create()
        //        section.emit(OpCode.MUL, indexSzReg, arrayElemSzReg, visit(index))

        // get the register containing the array address + calculated index
        val resReg = Register.Virtual.create()
        section.emit(OpCode.ADD, resReg, arrAddrReg, arrayElemSzReg)

        // load from this address the variable stored
        section.emit(MemAllocCodeGen.loadOpCodeFromType(arr.t), resReg, resReg, 0)
        resReg

      }
      case FieldAccessExpr(structure, name) => {
        val resReg = Register.Virtual.create()
        val structAddrReg = addrCodeGen.visit(structure)
        val fieldOffset = ExprCodeGen.extractFieldOffset(structure, name)
        section.emit(OpCode.LW, resReg, structAddrReg.get, fieldOffset)
        resReg
      }
      case TypecastExpr(castType, expr) => {
        castType match {
          case pointerType: PointerType => {
            // just return the address of the expr as it's being cast to pointer type
            addrCodeGen.visit(expr).get
          }
          case BaseType.INT => {
            // char to int
            val exprReg = visit(expr)
            exprReg
          }
          case wtf => {
            System.err.println("invalid cast type found: " + wtf)
            throw new RuntimeException()
          }
        }
      }
      case ValueAtExpr(expr) => {
        val ptrReg = visit(expr) // loads the address by word into register
        section.emit(OpCode.LW, ptrReg, ptrReg, 0) // loads the word stored at address
        ptrReg
      }
    }
  }


}

object ExprCodeGen {

  private def getVarExprFromClassExpr(e: Expr): Option[VarExpr] = {
    e match {
      case ClassFunCallExpr(classExpr, funCallExpr) => getVarExprFromClassExpr(classExpr)
      case ClassInstantiationExpr(classType) => None
      case SizeOfExpr(typeSize) => None
      case Assign(lhs, rhs) => getVarExprFromClassExpr(rhs)
      case AddressofExpr(expr) => getVarExprFromClassExpr(expr)
      case IntLiteral(x) => None
      case ChrLiteral(c) => None
      case StrLiteral(str) => None
      case varExpr: VarExpr => Some(varExpr)
      case funCallExpr: FunCallExpr => None
      case op: Op => None
      case BinOp(lhs, op, rhs) => getVarExprFromClassExpr(lhs); getVarExprFromClassExpr(rhs)
      case ArrayAccessExpr(arr, index) => getVarExprFromClassExpr(arr)
      case FieldAccessExpr(structure, name) => getVarExprFromClassExpr(structure)
      case TypecastExpr(castType, expr) => getVarExprFromClassExpr(expr)
      case ValueAtExpr(expr) => getVarExprFromClassExpr(expr)
    }
  }

  def extractFieldOffset(e: Expr, name: String): Int = {

    def visit(n: ASTNode): mutable.Map[VarDecl, Int] = {
      n match {
        case Program(decls) => decls.foreach(visit); null
        case value: Type => {
          value match {
            case classType: ClassType => {
              classType.classDecl.classType.varOffsetMap
            }
            case structType: StructType => {
              structType.structDecl.structType.varOffsetMap
            }
            case PointerType(t) => visit(t)
            case ArrayType(t, size) => visit(t)
            case _ => null
          }
        }
        case stmt: Stmt => {
          stmt match {
            case ExprStmt(expr) => visit(expr)
            case Return(stmt) => if (stmt.nonEmpty) visit(stmt.get) else null
            case If(conditionExpr, ifStmt, elseStmt) => {
              visit(conditionExpr)
              visit(ifStmt)
              if (elseStmt.nonEmpty) visit(elseStmt.get)
              null
            }
            case While(loopExpr, doStatement) => {
              visit(loopExpr)
              visit(doStatement)
            }
            case Block(vds, stmts) => {
              vds.foreach(visit)
              stmts.foreach(visit)
              null
            }
          }
        }
        case decl: Decl => {
          decl match {
            case ClassDecl(classType, parentClass, varDecls, funDecls) => null
            case FunDecl(t, name, params, block) => params.foreach(visit); visit(block)
            case StructTypeDecl(structType, varDecls) => null
            case VarDecl(t, name) => visit(t)
          }
        }
        case expr: Expr => {
          expr match {
            case SizeOfExpr(typeSize) => null
            case Assign(lhs, rhs) => visit(lhs); visit(rhs)
            case AddressofExpr(expr) => visit(expr)
            case IntLiteral(x) => null
            case ChrLiteral(c) => null
            case StrLiteral(str) => null
            case varExpr: VarExpr => {
              val t: Type = varExpr.t
              if (!t.isInstanceOf[StructType] && !t.isInstanceOf[ClassType]) {
                visit(t)
              } else {
                if (t.isInstanceOf[StructType]) {
                  val structType = t.asInstanceOf[StructType]
                  structType.structDecl.structType.varOffsetMap
                } else {
                  val classType = t.asInstanceOf[ClassType]
                  classType.classDecl.classType.varOffsetMap
                }
              }
            }
            case FunCallExpr(name, args) => null
            case op: Op => null
            case BinOp(lhs, op, rhs) => visit(lhs); visit(rhs)
            case ArrayAccessExpr(arr, index) => visit(arr)
            case FieldAccessExpr(structure, nm) => {
              val tup = visit(structure).find(vd => vd._1.name == nm).get
              val tmp = tup._1
              val tmpOffset = tup._2
              val map = visit(tmp)
              map.update(map.find(vd => vd._1.name == name).get._1,
                         map.find(vd => vd._1.name == name).get._2 + tmpOffset)
              map
            }
            case TypecastExpr(castType, expr) => visit(expr)
            case ValueAtExpr(expr) => visit(expr)
          }
        }
      }
    }

    visit(e).find(vd => vd._1.name == name).get._2
    //    e match {
    //      case varExpr: VarExpr => {
    //
    //        varExpr.t match {
    //          case structType: StructType => {
    //            varExpr.varDecl.t.asInstanceOf[StructType].structDecl.structType.varOffsetMap(name)
    //          }
    //          case wtf => {
    //            System.err.println("unexpected type in var expr: found " + wtf + " but expected a struct type")
    //            throw new RuntimeException()
    //          }
    //        }
    //      }
    //      case FieldAccessExpr(structure, n) => extractFieldOffset(structure, n)
    //      case wtf => {
    //        System.err.println("unexpected type in var expr: found " + wtf + " but expected a struct type")
    //        throw new RuntimeException()
    //      }
    //    }

  }
}