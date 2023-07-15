package sem

import ast._

import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

/**
 *
 * @author Zachary Hayden
 *         Date: 2/15/23
 */
class NameAnalyzer() extends BaseSemanticAnalyzer {
  private var scope: Scope = Scope() // initialized on construction

  // queue holding function parameters
  private val params = mutable.Queue[VarDecl]()

  // holding list of struct declaration names to ensure uniqueness
  private val structs = mutable.HashMap[String, StructTypeDecl]()

  // holding list of class declaration names to ensure uniqueness
  private val classes = mutable.HashMap[String, ClassDecl]()

  private def addBuiltInFns(program: Program): Unit = {
    program.decls.prepend(FunDecl(BaseType.VOID, "print_s", ArrayBuffer(VarDecl(PointerType(BaseType.CHAR), "s")),
                                  Block(ArrayBuffer[VarDecl](), ArrayBuffer[Stmt]())))
    program.decls.prepend(FunDecl(BaseType.VOID, "print_i", ArrayBuffer(VarDecl(BaseType.INT, "i")),
                                  Block(ArrayBuffer[VarDecl](), ArrayBuffer[Stmt]())))
    program.decls.prepend(FunDecl(BaseType.VOID, "print_c", ArrayBuffer(VarDecl(BaseType.CHAR, "c")),
                                  Block(ArrayBuffer[VarDecl](), ArrayBuffer[Stmt]())))
    program.decls
           .prepend(FunDecl(BaseType.CHAR, "read_c", ArrayBuffer(), Block(ArrayBuffer[VarDecl](), ArrayBuffer[Stmt]())))
    program.decls
           .prepend(FunDecl(BaseType.INT, "read_i", ArrayBuffer(), Block(ArrayBuffer[VarDecl](), ArrayBuffer[Stmt]())))
    program.decls.prepend(FunDecl(PointerType(BaseType.VOID), "mcmalloc", ArrayBuffer(VarDecl(BaseType.INT, "size")),
                                  Block(ArrayBuffer[VarDecl](), ArrayBuffer[Stmt]())))
  }

  def visit(node: ASTNode): Unit = {
    println("NAME ANALYSIS NODE: " + node) // TODO: remove

    node match {
      case program: Program => addBuiltInFns(program); program.decls.foreach(visit)
      case value: Type => {
        value match {
          // need to make sure the struct type has been defined
          case structType: StructType => {
            if (!structs.contains(structType.name)) error(
              s"struct type ($structType) used without matching struct declaration")
            else structType.structDecl = structs(structType.name) // link declaration to struct usage
          }
          case PointerType(t) => visit(t)
          case ArrayType(t, _) => visit(t)
          case classType: ClassType => {
            if (!classes.contains(classType.name)) {
              error(s"class type ($classType) used without matching class declaration")
            } else {
              classType.classDecl = classes(classType.name) // link the class declaration to usage
            }
          }
          case _ =>

        }
      }
      case stmt: Stmt => {
        stmt match {
          case ExprStmt(expr) => visit(expr)
          case Return(stmt) => if (stmt.nonEmpty) visit(stmt.get)
          case If(conditionExpr, ifStmt, elseStmt) => {
            visit(conditionExpr)
            visit(ifStmt)
            if (elseStmt.nonEmpty) visit(elseStmt.get)
          }

          case While(loopExpr, doStatement) => {
            visit(loopExpr)
            visit(doStatement)
          }

          case Block(vds, stmts) => {
            // save current scope and create new one
            val oldScope = scope
            scope = Scope(oldScope)

            // add function parameters to scope if this is fn block and they're params
            if (params.nonEmpty) while (params.nonEmpty) visit(params.dequeue())

            // visit the children
            vds.foreach(visit)
            stmts.foreach(visit)

            // restore previous scope
            scope = oldScope
          }
        }
      }
      case decl: Decl => {
        decl match {
          case funDecl: FunDecl => {
            scope.lookupCurrent(funDecl.name) match {
              case Some(_) => alreadyInScopeError(funDecl.name)
              case None => scope.put(FunSymbol(funDecl))
            }

            // add function parameters to be added to local block scope
            params ++= funDecl.params

            // visit block
            visit(funDecl.block)
          }

          case structTypeDecl: StructTypeDecl => {
            // make sure the name of the struct is unique within scope
            if (structs.contains(structTypeDecl.name)) {
              error(s"struct ${structTypeDecl.name} already defined")
            } else structs += (structTypeDecl.name -> structTypeDecl)

            // make sure all var declarations in struct are unique
            // save old scope and create new one
            val oldScope = scope
            scope = Scope()

            // visit var declarations in struct
            structTypeDecl.varDecls.foreach(visit)

            // replace scope
            scope = oldScope
          }

          case classDecl: ClassDecl => {
            // make if theres a parent class that it is actually a valid parent class
            if (classDecl.parentClass.nonEmpty) {
              if (classDecl.parentClass.get == null || !classes.contains(classDecl.parentClass.get.classDecl.name)) {
                error(s"Class ${classDecl.name} declared with subtype which doesn't exist / isn't a supertype of this")
              }

              // collect the super classes of this class
              val ancestors = ArrayBuffer[ClassType]()
              var nxt: ClassType = classDecl.parentClass.get
              ancestors += nxt
              while (nxt.classDecl.parentClass.nonEmpty) {
                ancestors += nxt.classDecl.parentClass.get
                nxt = nxt.classDecl.parentClass.get
              }

              if (!ancestors.contains(classDecl.parentClass.get)) {
                error(s"Class ${classDecl.name} declared with subtype which doesn't exist / isn't a supertype of this")
              }

              // go through the var decls and make sure none have been defined in ancestors
              ancestors.foreach(sup => {
                sup.classDecl.varDecls.foreach(svd => {
                  if (classDecl.varDecls.exists(_.name == svd.name)) {
                    error(s"Redefined class field $svd in ${classDecl.name}")
                  }

                })
              })


            }


            if (!scope.isGlobal()) error(s"class declaration for: ${classDecl.name} must be defined in global context")
            else scope.put(ClassSymbol(classDecl))

            // classes have to be unique in a global context
            if (classes.contains(classDecl.name)) {
              error(s"class ${classDecl.name} already defined")
            } else {
              classes += (classDecl.name -> classDecl)
              visit(classDecl.classType)
            }

            // make sure var declarations / fun decls in class are unique
            val oldScope = scope
            scope = Scope(scope)

            // visit var / fun declarations
            classDecl.varDecls.foreach(vd => {
              vd.fieldOf = Some(classDecl)
              visit(vd)
            })
            classDecl.funDecls.foreach(fd => {
              visit(fd)
            })

            // replace old scope
            scope = oldScope
          }

          case varDecl: VarDecl => {
            val s = scope.lookupCurrent(varDecl.name)
            if (s.nonEmpty) alreadyInScopeError(varDecl.name)
            else scope.put(VarSymbol(varDecl));
            visit(varDecl.t)
          }
        }
      }
      case expr: Expr => {
        expr match {

          case SizeOfExpr(typeSize) => visit(typeSize)
          case Assign(lhs, rhs) => visit(lhs); visit(rhs)
          case AddressofExpr(expr) => visit(expr)
          case IntLiteral(_) | ChrLiteral(_) | StrLiteral(_) =>
          case varExpr: VarExpr => {
            scope.lookup(varExpr.name) match {
              case Some(VarSymbol(varDecl)) => varExpr.varDecl = varDecl
              case _ => notInScopeError(varExpr.name)
            }
          }

          case funCallExpr: FunCallExpr => {
            scope.lookup(funCallExpr.name) match {
              case Some(FunSymbol(funDecl)) => {
                funCallExpr.funDecl = funDecl
                funCallExpr.args.foreach(visit)
              }
              case _ => notInScopeError(funCallExpr.name)
            }
          }

          case classFunCallExpr: ClassFunCallExpr => {
            visit(classFunCallExpr.classExpr)

            if (classes.values.flatMap(_.funDecls).exists(_.name == classFunCallExpr.funCallExpr.name)) {
              classFunCallExpr.funCallExpr.funDecl = classes.values.flatMap(_.funDecls).collectFirst({case x if x.name == classFunCallExpr.funCallExpr.name => x}).get
            } else {
              notInScopeError(classFunCallExpr.funCallExpr.name)
            }

//            val className = getVarExprNameFromClassExpr(classExpr)
//            scope.lookup(className) match {
//              case Some(x) => classes(x.getDecl().name).funDecls.map(_.name).contains(funCallExpr.name)
//              case None => notInScopeError(className)
//            }
//            if (!classes(className).funDecls.map(_.name).contains(funCallExpr.name)) {
//              notInScopeError(funCallExpr.name)
//            }
          }
          case ClassInstantiationExpr(classType) => {
            visit(classType)
          }

          case op: Op =>
          case BinOp(lhs, _, rhs) => visit(lhs); visit(rhs)
          case ArrayAccessExpr(arr, index) => visit(arr); visit(index)
          case FieldAccessExpr(structure, _) => {
            // make sure that the referenced struct is declared
            visit(structure)
          }

          case TypecastExpr(castType, expr) => {
            visit(castType)
            visit(expr)
          }

          case ValueAtExpr(expr) => {
            visit(expr)
          }
        }
      }

      case wtf => throw new IllegalStateException(s"unexpected value: $wtf")
    }
  }

  private def getVarExprNameFromClassExpr(e: Expr) : String = {
    e match {
      case ClassFunCallExpr(classExpr, funCallExpr) => getVarExprNameFromClassExpr(classExpr)
      case ClassInstantiationExpr(classType) => classType.name
      case SizeOfExpr(typeSize) => error(s"expected to reach a var expr found instead: ${typeSize}"); null
      case Assign(lhs, rhs) => getVarExprNameFromClassExpr(rhs)
      case AddressofExpr(expr) => getVarExprNameFromClassExpr(expr)
      case IntLiteral(x) => error(s"expected to reach a var expr found instead: ${x}"); null
      case ChrLiteral(c) => error(s"expected to reach a var expr found instead: ${c}"); null
      case StrLiteral(str) => error(s"expected to reach a var expr found instead: ${str}"); null
      case varExpr: VarExpr => varExpr.name
      case funCallExpr: FunCallExpr => error(s"expected to reach a var expr found instead: ${funCallExpr}"); null
      case op: Op => error(s"expected to reach a var expr found instead: ${op}"); null
      case BinOp(lhs, op, rhs) => getVarExprNameFromClassExpr(lhs); getVarExprNameFromClassExpr(rhs)
      case ArrayAccessExpr(arr, index) => getVarExprNameFromClassExpr(arr)
      case FieldAccessExpr(structure, name) => getVarExprNameFromClassExpr(structure)
      case TypecastExpr(castType, expr) => getVarExprNameFromClassExpr(expr)
      case ValueAtExpr(expr) => getVarExprNameFromClassExpr(expr)
    }
  }
}
