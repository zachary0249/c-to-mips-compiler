package sem

import ast._

import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

/**
 *
 * @author Zachary Hayden
 *         Date: 2/15/23
 */
class TypeAnalyzer extends BaseSemanticAnalyzer {

  private var lastFunDecl: Option[FunDecl] = None

  def visit(node: ASTNode): Type = {
    println("TYPE ANALYSIS NODE: " + node) // TODO: remove, only for debug

    node match {

      case Program(decls) => {
        decls.foreach(visit)
        BaseType.NONE
      }

      case value: Type => value

      case stmt: Stmt => {
        stmt match {
          case ExprStmt(expr) => visit(expr)

          case returnStmt: Return => {
            // when return nothing
            if (returnStmt.stmt.isEmpty && lastFunDecl.nonEmpty && lastFunDecl.get.t == BaseType.VOID) {
              // TODO: should last fun decl be reset??? >> lastFunDecl = None
              BaseType.NONE
            }
            // when return something
            else if (returnStmt.stmt.nonEmpty && lastFunDecl.nonEmpty && lastFunDecl.get.t == visit(
              returnStmt.stmt.get)) {
              BaseType.NONE
            } else {
              error("invalid return statement")
              BaseType.INVALID
            }
          }

          case ifStmt: If => {
            if (visit(ifStmt.conditionExpr) != BaseType.INT) {
              error("if statement's condition is not of type INT")
              BaseType.INVALID
            } else {
              // visit children
              visit(ifStmt.ifStmt)
              if (ifStmt.elseStmt.nonEmpty) visit(ifStmt.elseStmt.get)
              BaseType.NONE
            }
          }

          case whileNode: While => {
            if (visit(whileNode.loopExpr) != BaseType.INT) {
              error("while condition is not of type INT")
              BaseType.INVALID
            } else {
              visit(whileNode.doStatement)
              BaseType.NONE
            }
          }

          case Block(vds, stmts) => {
            vds.foreach(visit)
            stmts.foreach(visit)
            BaseType.NONE
          }
        }
      }

      case decl: Decl => {
        decl match {
          case ClassDecl(classType, parentClass, varDecls, funDecls) => {
            visit(classType)
            if (parentClass.nonEmpty) visit(parentClass.get)
            varDecls.foreach(visit)
            funDecls.foreach(visit)

            BaseType.NONE
          }

          case funDecl: FunDecl => {
            lastFunDecl = Some(funDecl)
            // visit children
            funDecl.params.foreach(visit)
            visit(funDecl.block)

            BaseType.NONE
          }

          case StructTypeDecl(structType, varDecls) => {
            visit(structType)
            varDecls.foreach(visit);
            BaseType.NONE
          }

          case VarDecl(t, _) => {
            if (t == BaseType.VOID) voidTypeError()
            BaseType.NONE
          }
        }
      }

      case expr: Expr => {
        expr match {

          case classInstantiationExpr: ClassInstantiationExpr => {
            classInstantiationExpr.t = classInstantiationExpr.classType
            classInstantiationExpr.t
          }

          case classFunCallExpr: ClassFunCallExpr => {
            val classType = visit(classFunCallExpr.classExpr)

            classType match {
              case classType: ClassType => {
                // tag the class fun call with reference to the class object
                classFunCallExpr.classDecl = classType.classDecl

                classFunCallExpr.t = visit(classFunCallExpr.funCallExpr)
                classFunCallExpr.t
              }
              case wtf => {
                error("expected class type from class function call expression, received: " + wtf)
                BaseType.INVALID
              }
            }
          }

          case sizeOfExpr: SizeOfExpr => {
            // axiom
            sizeOfExpr.t = BaseType.INT
            sizeOfExpr.t
          }

          case assign: Assign => {
            val lhsType = visit(assign.lhs)
            val rhsType = visit(assign.rhs)

            if (isVoid(lhsType) || isVoid(rhsType) || isArrayType(lhsType) || isArrayType(rhsType)) {
              error("invalid assignment operand types")
              BaseType.INVALID
            } else if (lhsType != rhsType) {
              error("assignment between operands of different types")
              BaseType.INVALID
            } else {
              assign.t = lhsType
              assign.t
            }
          }

          case addressofExpr: AddressofExpr => {
            val eType = visit(addressofExpr.expr)
            addressofExpr.t = PointerType(eType)
            addressofExpr.t
          }

          case intLiteral: IntLiteral => intLiteral.t = BaseType.INT; BaseType.INT
          case chrLiteral: ChrLiteral => chrLiteral.t = BaseType.CHAR; BaseType.CHAR
          case strLiteral: StrLiteral => {
            strLiteral.t = ArrayType(BaseType.CHAR, strLiteral.str.length + 1);
            ArrayType(
              BaseType.CHAR, strLiteral.str.length + 1)
          }
          case varExpr: VarExpr => {
            varExpr.t = varExpr.varDecl.t
            varExpr.t
          }

          case funCallExpr: FunCallExpr => {
            val funDecl = funCallExpr.funDecl
            if (funCallExpr.args.length != funDecl.params.length) {
              error("number of arguments given doesn't match number of function parameters")
              return BaseType.INVALID
            }

            // check type of params match args
            for (i <- funCallExpr.args.indices) {
              if (funDecl.params(i).t != visit(funCallExpr.args(i))) {
                typeMismatchError(funDecl.params(i).t, funCallExpr.args(i).t)
                return BaseType.INVALID
              }
            }
            funCallExpr.t = funDecl.t
            funCallExpr.t
          }

          case _: Op => BaseType.NONE

          case binOp: BinOp => {
            val lhsType = visit(binOp.lhs)
            val rhsType = visit(binOp.rhs)

            binOp.op match {
              case ADD | SUB | MUL | DIV | MOD | OR | AND | GT | LT | GE | LE => {
                if (lhsType == BaseType.INT && rhsType == BaseType.INT) {
                  binOp.t = BaseType.INT // set the type

                  BaseType.INT
                } else {
                  typeMismatchError(BaseType.INT, lhsType, rhsType)
                  BaseType.INVALID
                }
              }
              case NE | EQ => {
                // neither operands can be of type {StructType, ArrayType, void}
                // and they must be the same type
                if (notStructType(lhsType) && notStructType(rhsType) && notArrayType(lhsType) && notArrayType(
                  rhsType) && notVoid(lhsType) && notVoid(rhsType) && lhsType == rhsType) {
                  binOp.t = BaseType.INT
                  BaseType.INT
                }
                else {
                  invalidOpOperandsError()
                  BaseType.INVALID
                }
              }
            }
          }

          case arrayAccessExpr: ArrayAccessExpr => {
            if (isArrayType(visit(arrayAccessExpr.arr)) && visit(arrayAccessExpr.index) == BaseType.INT) {
              arrayAccessExpr.t = extractElemType(arrayAccessExpr.arr.t)
              arrayAccessExpr.t
            }
            else if (isPointerType(visit(arrayAccessExpr.arr)) && visit(arrayAccessExpr.index) == BaseType.INT) {
              arrayAccessExpr.t = extractElemType(arrayAccessExpr.arr.t)
              arrayAccessExpr.t
            } else {
              error("array access only permitted as {ArrayType, PointerType}[{INT}]")
              BaseType.INVALID
            }

            //            if (notArrayType(visit(arrayAccessExpr.arr)) || !isPointerType(visit(arrayAccessExpr.arr.t))) {
            //              error("array access must be applied to array type or pointer type")
            //              BaseType.INVALID
            //            } else if (visit(arrayAccessExpr.index) != BaseType.INT) {
            //              error("array access must be indexed by type int")
            //              BaseType.INVALID
            //            } else {
            //              arrayAccessExpr.t = arrayAccessExpr.arr.t
            //              arrayAccessExpr.t
            //            }
          }

          case fieldAccessExpr: FieldAccessExpr => {
            var structureType = visit(fieldAccessExpr.structure)
            while (notStructType(structureType) && notClassType(structureType)) {
              structureType match {
                case structType: StructType => structureType = structType
                case classType: ClassType => structureType = classType
                case PointerType(t) => structureType = t
                case ArrayType(t, _) => structureType = t
                // otherwise must be an invalid type
                case _ => {
                  error(
                    s"expected to find struct type for field access, found $structureType instead");
                  return BaseType
                    .INVALID
                }
              }
            }

            // cast from Type -> StructType bc we know that if we got here it must be struct type
            structureType match {
              case structType: StructType => {
                val struct = structureType.asInstanceOf[StructType]
                // error if accessed field is not declared in the structs declaration
                if (!struct.structDecl.varDecls.exists(vd => vd.name == fieldAccessExpr.name)) {
                  error(s"\'struct ${struct.name}\' has no field \'${fieldAccessExpr.name}\'")
                  BaseType.INVALID
                }
                else {
                  // assign the expression to type of accessed field
                  // we know that the field exists if we're here
                  val fieldType = struct.structDecl.varDecls
                                        .collectFirst({ case x if x.name == fieldAccessExpr.name => x.t }).get
                  fieldAccessExpr.t = fieldType
                  fieldAccessExpr.t
                }
              }
              case classType: ClassType => {
                // get the ancestors' var decls of the class type
                val familyVds: mutable.Buffer[VarDecl] = mutable.ArrayBuffer()
                familyVds ++= classType.classDecl.varDecls

                var nxt = classType.classDecl.parentClass
                while (nxt.nonEmpty) {
                  familyVds ++= (nxt.get.classDecl.varDecls)
                  nxt = nxt.get.classDecl.parentClass
                }

                if (!classType.classDecl.varDecls.exists(_.name == fieldAccessExpr.name) && !familyVds.exists(_.name == fieldAccessExpr.name)) {
                  error(s"\'class ${classType.name}\' has no field \'${fieldAccessExpr.name}\'")
                  BaseType.INVALID
                } else {
                  // get field type from either this class or ancestors
                  val fieldType: Type = familyVds.collectFirst({ case x if x.name == fieldAccessExpr.name => x.t }).get
                  fieldAccessExpr.t = fieldType
                  fieldAccessExpr.t
                }
              }
            }


          }

          case typecastExpr: TypecastExpr => {
            val existingType = visit(typecastExpr.expr)

            // if class type for existing and casting type
            if (!notClassType(existingType) && !notClassType(typecastExpr.castType)) {
              val classType = existingType.asInstanceOf[ClassType]
              // collect the super classes of this class
              val ancestors = ArrayBuffer[ClassType]()
              var nxt: ClassType = classType
              while (nxt.classDecl.parentClass.nonEmpty) {
                ancestors += nxt.classDecl.parentClass.get
                nxt = nxt.classDecl.parentClass.get
              }

              // checking that the type cast type is a type of an ancestor of the base class
              if (ancestors.contains(typecastExpr.castType)) {
                typecastExpr.t = typecastExpr.castType
                typecastExpr.t
              } else {
                error(s"$existingType class is being casted to ${
                  typecastExpr.castType
                } which is not an ancestor of base class")
                BaseType.INVALID
              }

//              classType.classDecl.parentClass match {
//                case Some(x) => {
//                  if (x == typecastExpr.castType) {
//                    typecastExpr.t = typecastExpr.castType
//                    typecastExpr.t
//                  } else {
//                    error(s"$existingType class is being casted to ${typecastExpr.castType} which is not an ancestor of base class")
//                    BaseType.INVALID
//                  }
//                }
//                case None => {
//                  error("type casting class with no ancestor")
//                  BaseType.INVALID
//                }
//              }
            }
            else if (existingType == BaseType.CHAR && typecastExpr.castType == BaseType.INT) {
              // char to int
              typecastExpr.t = BaseType.INT
              typecastExpr.t
            } else if (isArrayType(existingType) && isPointerType(typecastExpr.castType)) {
              // array to pointer
              (existingType, typecastExpr.castType) match {
                // check and make sure pointer cast type is same as type of elements in array
                case (ArrayType(at, _), PointerType(pt)) if at == pt => {
                  typecastExpr.t = PointerType(at)
                  typecastExpr.t
                }
                case _ => error("pointer cast type must be same as array element type"); BaseType.INVALID
              }
            } else if (isPointerType(existingType) && isPointerType(typecastExpr.castType)) {
              // pointer to pointer
              typecastExpr.castType match {
                case PointerType(t) => {
                  typecastExpr.t = PointerType(t)
                  typecastExpr.t
                }
                case _ => {
                  error(s"unexpected type (${typecastExpr.castType}) found during ptr to ptr cast")
                  BaseType.INVALID
                }
              }
            } else {
              error("invalid type cast operands")
              BaseType.INVALID
            }
          }

          case valueAtExpr: ValueAtExpr => {
            val p = visit(valueAtExpr.expr)

            p match {
              case PointerType(t) => {
                valueAtExpr.t = t
                t
              }
              case _ => {
                error("expected pointer type for \'value at (*)\' expression")
                BaseType.INVALID
              }
            }
          }
        }
      }

      case wtf => throw new IllegalStateException(s"Unexpected value: $wtf")
    }
  }

  private def extractElemType(node: Type): Type = {
    node match {
      case ArrayType(t, _) => t
      case PointerType(t) => t
      case _ => {
        error(s"expected array access expression ∈ {ArrayType, PointerType} found $node instead")
        BaseType.UNKNOWN
      }
    }
  }

  private def isPointerType(t: Type): Boolean = {
    t match {
      case PointerType(_) => true
      case _ => false
    }
  }

  private def notPointerType(t: Type): Boolean = !isPointerType(t)

  private def notStructType(t: Type): Boolean = {
    t match {
      case StructType(_) => false
      case _ => true
    }
  }

  private def notClassType(t: Type): Boolean = {
    t match {
      case ClassType(_) => false
      case _ => true
    }
  }

  private def isStructType(t: Type): Boolean = {
    !notStructType(t)
  }

  private def notArrayType(t: Type): Boolean = {
    t match {
      case ArrayType(_, _) => false
      case _ => true
    }
  }

  private def isArrayType(t: Type): Boolean = {
    !notArrayType(t)
  }

  private def notVoid(t: Type): Boolean = {
    t match {
      case BaseType.VOID => false
      case _ => true
    }
  }

  private def isVoid(t: Type): Boolean = {
    !notVoid(t)
  }
}
