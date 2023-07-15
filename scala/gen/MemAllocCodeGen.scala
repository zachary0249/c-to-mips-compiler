package gen

import ast._
import gen.asm._
import util.GenUtil

import scala.annotation.tailrec
import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

/**
 * This allocator should deal with all global and local variable declarations.
 *
 * @author Zachary Hayden
 *         Date: 3/8/23
 */
class MemAllocCodeGen(val asmProg: AssemblyProgram) extends CodeGen {
  var fpOffset = 0
  private val section = asmProg.getCurrentSection

  def allocateGlobal(n: mutable.Buffer[Decl]): Unit = {

    n.foreach {
      case classDecl: ClassDecl => {

        val classLbl = Label.create(classDecl.name)
        // tag the class type with label
        classDecl.classType.label = Some(classLbl)

        // for each method create unique label and tag it
        classDecl.funDecls.foreach(fd => {
          fd.label = Label.create(s"${fd.name}")
          // emit the function label that will then get filled in with address of implemented function
//          section.emit(fd.label, Directive("space 4"))

          // attach the result statement to fd (if exists)
          fd.block.stmts.foreach(s => GenUtil.tagReturn(s, fd))

          // collect all strings, store them in this fun-decl node to be emitted in
          // FunCodeGen
          fd.strLiterals = collectStrLiterals(fd.block.stmts)
          fd.strLiterals.foreach(str => {
            // assign a label to each string literal
            val lbl = Label.create(fd.name + "_str")
            str.label = lbl

          })

//          // loop over all var decls and generate storage for the class decls
//          fd.block.vds.foreach(vd => {
//            var szAcc = 0
//            val classLbl = Label.create(s"${classDecl.name}_${vd.name}")
//
//            classDecl.classType.classDecl.varDecls.foreach(vd => {
//              val sizeOfPad = MemAllocCodeGen.sizeOfPad(vd.t)
//              szAcc += sizeOfPad
//            })
//
//            section.emit(classLbl, Directive(s"space ${szAcc + 4}")) // add 4 bc we keep vtable pointer at the head
//            vd.label = Some(classLbl)
//          })
        })

        // emit space for the virtual table for the class's functions
        section.emit(classLbl, Directive(s"space ${4 * classDecl.funDecls.size}"))

        // find all ancestors until reach one without parent
        var next = classDecl
        val familyTree = mutable.Stack[ClassDecl]()
        familyTree.push(next)
        while (next.parentClass.nonEmpty) {
          next = next.parentClass.get.classDecl
          familyTree.push(next)
        }

        // collect its methods' labels in their creation order and store a map
        val fnNameToLabel = mutable.LinkedHashMap[String, Label]()
        val familyTreeFns = familyTree.clone()
        while (familyTreeFns.nonEmpty) {
          val cls = familyTreeFns.pop()
          cls.funDecls.foreach(fd => {
            fnNameToLabel(fd.name) = fd.label
          })
        }


        classDecl.classType.virtualTable = fnNameToLabel



        // collecting the fields and creating map of offsets to be attached to the struct type
        var baseOffset = 4 // starts at 4 cause there's a pointer at base address 0
        while (familyTree.nonEmpty) {
          val cd = familyTree.pop()

          cd.varDecls.foreach(vd => {
            classDecl.classType.varOffsetMap += (vd -> baseOffset)
            baseOffset += MemAllocCodeGen.sizeOfPad(vd.t) // each field is padded to a 4 byte offset
            // set label of field var decl
            vd.label = Some(cd.classType.label.get)
          }
                              )
        }


      }


      case funDecl: FunDecl => {
        // attach the result statement to fd (if exists)
        funDecl.block.stmts.foreach(s => GenUtil.tagReturn(s, funDecl))

        // collect all strings, store them in this fun-decl node to be emitted in
        // FunCodeGen
        funDecl.strLiterals = collectStrLiterals(funDecl.block.stmts)
        funDecl.strLiterals.foreach(str => {
          // assign a label to each string literal
          val lbl = Label.create(funDecl.name + "_str")
          str.label = lbl
        })
      }
      case structTypeDecl: StructTypeDecl => {
        val structLbl = Label.create(structTypeDecl.name)
        // collecting the fields and creating map of offsets to be attached to the struct type
        var baseOffset = 0
        structTypeDecl.varDecls.foreach(vd => {
          structTypeDecl.structType.varOffsetMap += (vd -> baseOffset)
          baseOffset += MemAllocCodeGen.sizeOfPad(vd.t) // each field is padded to a 4 byte offset
          // set label of field var decl
          vd.label = Some(structLbl)
        })

        // set the label of the struct itself
        structTypeDecl.structType.label = Some(structLbl)
      }

      case vd: VarDecl => {
        // storing the var decl associated label

        vd.t match {
          case structType: StructType => {
            var szAcc = 0
            val structLbl = structType.label.get
            structType.structDecl.varDecls.foreach {
              varDecl =>
                // accumulates the size of the struct using a 4 byte allign for each member
                val sizeofPad = MemAllocCodeGen.sizeOfPad(varDecl.t)
                //                varDecl.label = Some(structLbl) // assigning the label of the vars to be that of the struct; use offset
                //                structType.varOffsetMap += (varDecl -> szAcc)
                szAcc += sizeofPad


              //                val sz = MemAllocCodeGen.sizeOf(varDecl.t)
              //                val lbl = Label.create(s"${vd.name}_${structType.name}_${varDecl.name}")
              //                section.emit(lbl, Directive(s"space $sz"))
              //                // add the label to the var decl AST node
              //                varDecl.label = Some(lbl)
              //
              //                // adds space padding if needed
              //                MemAllocCodeGen.pad(sz, s"${vd.name}_${structType.name}_${varDecl.name}")
              //                               .foreach(labelDirective => section.emit(labelDirective._1, labelDirective._2))
              //
              //
            }

            section.emit(structLbl, Directive(s"space $szAcc"))

            // attach the struct label to the struct var decl
            vd.label = Some(structLbl)
          }
          case classType: ClassType => {
            var szAcc = 0
            val classLbl = classType.label.get

            classType.classDecl.varDecls.foreach(vd => {
              val sizeOfPad = MemAllocCodeGen.sizeOfPad(vd.t)
              szAcc += sizeOfPad
            })

            section.emit(classLbl, Directive(s"space ${szAcc + 4}")) // add 4 bc we keep vtable pointer at the head
            vd.label = Some(classLbl)
          }

          // wont need padding cause pointer types are 4 bytes (int)
          case pointerType: PointerType => {
            // special handling if the pointer type is char (string)
            // TODO: strings

            val lbl = Label.create(vd.name)
            vd.label = Some(lbl) // add label to node
            section.emit(lbl, Directive(s"space ${MemAllocCodeGen.sizeOf(pointerType)}"))
          }
          // TODO: should we be considering strings as arrays and using asciiz accordingly??
          case arrayType: ArrayType => {
            val lbl = Label.create(vd.name)
            // includes the end padding for array
            section.emit(lbl, Directive(s"space ${MemAllocCodeGen.sizeOfPad(arrayType)}"))
            vd.label = Some(lbl)
          }
          case BaseType.INT => {
            val lbl = Label.create(vd.name)
            section.emit(lbl, Directive(s"space 4"))
            vd.label = Some(lbl)
          }
          case BaseType.CHAR => {
            val lbl = Label.create(vd.name)
            section.emit(lbl, Directive(s"space ${MemAllocCodeGen.sizeOf(BaseType.CHAR)}"))
            vd.label = Some(lbl)
            // TODO: do we need a pad?? MemAllocCodeGen.pad(1, vd.name).map(ld => section.emit(ld._1, ld._2))
          }
          case wtf => {
            System.err.println(
              "Unexpected type found in var decl during global allocation : " + wtf);
            throw new RuntimeException
          }
        }
      }
    }
  }

  def allocateLocal(n: ASTNode): Unit = {
    n match {
      case Program(decls) => decls.foreach(allocateLocal)
      case value: Type => // do nothing for types
      case stmt: Stmt => {
        stmt match {
          case ExprStmt(expr) => allocateLocal(expr)
          case Return(stmt) => if (stmt.nonEmpty) allocateLocal(stmt.get)
          case If(conditionExpr, ifStmt, elseStmt) => {
            allocateLocal(conditionExpr)
            allocateLocal(ifStmt)
            if (elseStmt.nonEmpty) allocateLocal(elseStmt.get)
          }
          case While(loopExpr, doStatement) => allocateLocal(loopExpr); allocateLocal(doStatement)
          case Block(vds, stmts) => vds.foreach(allocateLocal); stmts.foreach(allocateLocal)
        }
      }
      case decl: Decl => {
        decl match {
          case fd: FunDecl => {
            var offset = 4 // skip return address
            fd.returnValFPOffset = offset + fd.returnSize
            offset += fd.returnSize

            for (d <- fd.params.reverse) {
              val dSize = MemAllocCodeGen.sizeOf(d.t)
              d.fpOffset = Some(offset + dSize)
              offset += dSize
            }


            // skip frame pointer
            this.fpOffset = 4
            allocateLocal(fd.block)
          }
          case StructTypeDecl(structType, varDecls) => // do nothing, structs are global variable declarations
          case varDecl: VarDecl => {
            varDecl.fpOffset = Some(fpOffset)
            fpOffset -= MemAllocCodeGen.sizeOf(varDecl.t) // allocated space

            // reserve space on stack for local var decl
            section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -MemAllocCodeGen.sizeOf(varDecl.t))

          }
        }
      }
      case expr: Expr => {
        expr match {
          case ClassFunCallExpr(classExpr, funCallExpr) => allocateLocal(funCallExpr)
          case ClassInstantiationExpr(classType) => {

          }
          case SizeOfExpr(typeSize) => // do nothing its a type
          case Assign(lhs, rhs) => allocateLocal(lhs); allocateLocal(rhs)
          case AddressofExpr(expr) => allocateLocal(expr)
          case IntLiteral(x) =>
          case ChrLiteral(c) =>
          case StrLiteral(str) =>
          case VarExpr(_) =>
          case FunCallExpr(_, args) => args.foreach(allocateLocal)
          case op: Op =>
          case BinOp(lhs, _, rhs) => allocateLocal(lhs); allocateLocal(rhs)
          case ArrayAccessExpr(arr, index) => allocateLocal(arr); allocateLocal(index)
          case FieldAccessExpr(structure, _) => allocateLocal(structure)
          case TypecastExpr(_, expr) => allocateLocal(expr)
          case ValueAtExpr(expr) => allocateLocal(expr)
        }
      }
    }


  }


  private def emitClassInstantiations(stmts: mutable.Buffer[Stmt]): Unit = {
    stmts.foreach(stmt => {

    })

    def visit(node: ASTNode): Unit = {
      node match {
        case Program(decls) => decls.foreach(visit)
        case value: Type =>
        case stmt: Stmt => {
          stmt match {
            case ExprStmt(expr) => visit(expr)
            case Return(stmt) => if (stmt.nonEmpty) visit(stmt.get)
            case If(conditionExpr, ifStmt, elseStmt) => visit(ifStmt); if (elseStmt.nonEmpty) visit(elseStmt.get)
            case While(loopExpr, doStatement) => visit(doStatement)
            case Block(vds, stmts) =>
          }
        }
        case decl: Decl => ???
        case expr: Expr => ???
      }
    }
  }

  private def collectStrLiterals(stmts: mutable.Buffer[Stmt]): mutable.Buffer[StrLiteral] = {
    val strlits = mutable.ArrayBuffer.empty[StrLiteral]

    def aux(n: ASTNode): Unit = {
      n match {
        case Program(decls) => decls.foreach(aux)
        case value: Type =>
        case stmt: Stmt => {
          stmt match {
            case ExprStmt(expr) => aux(expr)
            case Return(stmt) => if (stmt.nonEmpty) aux(stmt.get)
            case If(conditionExpr, ifStmt, elseStmt) => {
              aux(conditionExpr);
              aux(ifStmt);
              if (elseStmt.nonEmpty) aux(elseStmt.get)
            }
            case While(loopExpr, doStatement) => aux(loopExpr); aux(doStatement)
            case Block(vds, stmts) => vds.foreach(aux); stmts.foreach(aux)
          }
        }
        case decl: Decl => {
          decl match {
            case ClassDecl(classType, parentClass, varDecls, funDecls) => {
              varDecls.foreach(aux)
              funDecls.foreach(aux)
            }
            case FunDecl(t, name, params, block) => params.foreach(aux); aux(block)
            case StructTypeDecl(structType, varDecls) => varDecls.foreach(aux)
            case VarDecl(t, name) =>
          }
        }
        case expr: Expr => {
          expr match {
            case ClassFunCallExpr(classExpr, funCallExpr) => {
              aux(funCallExpr)
            }
            case ClassInstantiationExpr(classType) =>
            case SizeOfExpr(typeSize) =>
            case Assign(lhs, rhs) => aux(lhs); aux(rhs)
            case AddressofExpr(expr) => aux(expr)
            case IntLiteral(x) =>
            case ChrLiteral(c) =>
            case strLiteral: StrLiteral => {
              strlits += strLiteral
            }
            case VarExpr(name) =>
            case FunCallExpr(name, args) => args.foreach(aux)
            case op: Op =>
            case BinOp(lhs, op, rhs) => aux(lhs); aux(rhs)
            case ArrayAccessExpr(arr, index) => aux(arr); aux(index)
            case FieldAccessExpr(structure, name) => aux(structure)
            case TypecastExpr(castType, expr) => aux(expr)
            case ValueAtExpr(expr) => aux(expr)
          }
        }
      }
    }

    stmts.foreach(aux)
    strlits
  }
}

object MemAllocCodeGen {
  /**
   *
   * @param varDecl var decl to check
   * @return if global variable (static allocation)
   */
  def isStaticAlloc(varDecl: VarDecl): Boolean = {
    if (varDecl.label.nonEmpty) true // global variable
    else false
  }

  def isDynamicAlloc(varDecl: VarDecl): Boolean = {
    if (varDecl.fpOffset.nonEmpty) true
    else false
  }

  val loadOpCodeFromType: PartialFunction[Type, OpCode.Load] = new PartialFunction[Type, OpCode.Load] {
    override def isDefinedAt(x: Type): Boolean = {
      x match {
        case ClassType(_) => true
        case StructType(name) => true
        case PointerType(t) => true
        case ArrayType(t, size) => true
        case BaseType.CHAR | BaseType.INT => true
        case _ => false
      }
    }

    @tailrec
    override def apply(v1: Type): OpCode.Load = {
      v1 match {
        case ClassType(_) => OpCode.LW
        case BaseType.CHAR => OpCode.LB
        case BaseType.INT => OpCode.LW
        case StructType(_) => OpCode.LW // if we're loading a struct it'll be its address
        case PointerType(_) => OpCode.LW
        case ArrayType(t, size) => apply(t)
      }
    }
  }

  val storeOpCodeFromType: PartialFunction[Type, OpCode.Store] = new PartialFunction[Type, OpCode.Store] {
    override def isDefinedAt(x: Type): Boolean = {
      x match {
        case StructType(name) => true
        case ClassType(name) => true
        case PointerType(t) => true
        case ArrayType(t, size) => false
        case BaseType.CHAR | BaseType.INT => true
        case _ => false
      }
    }

    override def apply(v1: Type): OpCode.Store = {
      v1 match {
        case BaseType.CHAR => OpCode.SB
        case BaseType.INT => OpCode.SW
        case StructType(_) => OpCode.SW // storing a struct will be its pointer ie 4 bytes
        case ClassType(_) => OpCode.SW
        case PointerType(_) => OpCode.SW
      }
    }
  }

  /**
   *
   * @param t type to get size of
   * @return size in bytes of the given type
   */
  def sizeOf(t: Type): Int = {
    t match {
      case classType: ClassType => {
        // each var decl in struct is aligned to 4 bytes ie use sizeofPad
        var szAcc = 4 // start with 4 because we keep extra 4 bytes as pointer for vtable
        classType.classDecl.varDecls.foreach(vd => szAcc += sizeOfPad(vd.t))
        szAcc
      }
      case structType: StructType => {
        // each var decl in struct is aligned to 4 bytes ie use sizeofPad
        var szAcc = 0
        structType.structDecl.varDecls.foreach(vd => szAcc += sizeOfPad(vd.t))
        szAcc
      }
      case PointerType(_) => 4
      case ArrayType(t, size) => sizeOfArr(t) * size
      case BaseType.INT => 4
      case BaseType.CHAR => 4
      case BaseType.VOID => 0
      case wtf => System.err.println("unexpected type when calculating its size: " + wtf); throw new RuntimeException
    }
  }

  @tailrec
  def sizeOfElem(t: Type): Int = {
    t match {
      case classType: ClassType => {
        // each var decl in struct is aligned to 4 bytes ie use sizeofPad
        var szAcc = 4 // start with 4 because we keep extra 4 bytes as pointer for vtable
        classType.classDecl.varDecls.foreach(vd => szAcc += sizeOfPad(vd.t))
        szAcc
      }
      case structType: StructType => {
        // each var decl in struct is aligned to 4 bytes ie use sizeofPad
        var szAcc = 0
        structType.structDecl.varDecls.foreach(vd => szAcc += sizeOfPad(vd.t))
        szAcc
      }
      case PointerType(_) => 4
      case ArrayType(t, size) => sizeOfElem(t)
      case BaseType.INT => 4
      case BaseType.CHAR => 1
      case BaseType.VOID => 0
      case wtf => System.err.println("unexpected type when calculating its size: " + wtf); throw new RuntimeException
    }
  }

  def sizeOfArr(t: Type): Int = {
    t match {
      case classType: ClassType => {
        // each var decl in struct is aligned to 4 bytes ie use sizeofPad
        var szAcc = 4 // start with 4 because we keep extra 4 bytes as pointer for vtable
        classType.classDecl.varDecls.foreach(vd => szAcc += sizeOfPad(vd.t))
        szAcc
      }
      case structType: StructType => {
        var szAcc = 0
        structType.structDecl.varDecls.foreach(vd => szAcc += sizeOfPad(vd.t))
        szAcc
      }
      case PointerType(t) => 4
      case ArrayType(t, size) => sizeOfArr(t) * size
      case BaseType.CHAR => 1
      case BaseType.INT => 4
      case wtf => System.err.println("unexpected type when calculating its size: " + wtf); throw new RuntimeException
    }
  }

  /**
   *
   * @param sizeOf size of type to find pad amount for
   * @return the pad amount needed for 4 byte alignment; pad size of 0 indicates there's no padding needed
   */
  def padding(sizeOf: Int): Int = {
    val padSize = 4 - (sizeOf % 4)
    // if padSize == 4 means that either sizeOf == 0 || the remainder is 0 indicating no padding needed
    if (padSize == 4) 0 else padSize
  }

  /**
   *
   * @param t type to get size of including padding if needed
   * @return size of type with the padding included if it's needed, used for arrays eg
   */
  def sizeOfPad(t: Type): Int = {
    val sizeof = sizeOf(t)
    sizeof + padding(sizeof)
  }

  private def pad(sizeOf: Int, varName: String): Option[(Label, Directive)] = {
    val padSize = padding(sizeOf)

    if (padSize != 0) { // when padding is needed
      Some((Label.create(s"padding_${varName}"), Directive(s"space $padSize")))
    } else None
  }
}