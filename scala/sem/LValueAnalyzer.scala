package sem

import ast._

/**
 * Checks and makes sure that the only values on the left side of an assignment expression are
 * intuitively only things with some identifiable memory location. For us this will be:
 * VarExpr, ArrayAccessExpr, ValueAtExpr and FieldAccessExpr.
 * Note that a FieldAccessExpr is an lvalue only if the first expression (the structure you are accessing)
 * is itself an lvalue.
 *
 * @author Zachary Hayden
 *         Date: 2/22/23
 */
class LValueAnalyzer extends BaseSemanticAnalyzer {

  /**
   * Traverses the AST for the program it's given and determines if proper lvalues are used.
   *
   * @param node program AST to visit
   * @return if the given node is a valid lvalue
   */
  def visit(node: ASTNode): Boolean = {
    println("LVALUE NODE: " + node)

    node match {
      case Program(decls) => decls.foreach(visit); false
      case _: Type => false
      case stmt: Stmt => {
        stmt match {
          case ExprStmt(expr) => visit(expr); false
          case Return(stmt) => if (stmt.nonEmpty) visit(stmt.get); false
          case If(conditionExpr, ifStmt, elseStmt) => {
            visit(conditionExpr)
            visit(ifStmt)
            if (elseStmt.nonEmpty) visit(elseStmt.get)
            false
          }

          case While(loopExpr, doStatement) => {
            visit(loopExpr)
            visit(doStatement)
            false
          }

          case Block(vds, stmts) => {
            vds.foreach(visit)
            stmts.foreach(visit)
            false
          }
        }
      }

      case decl: Decl => {
        decl match {
          case FunDecl(_, _, _, block) => visit(block); false
          case _: StructTypeDecl => false
          case _: VarDecl => false
          case ClassDecl(classType, parentClass, varDecls, funDecls) => {
            funDecls.foreach(visit)
            false
          }
        }
      }

      case expr: Expr => {
        expr match {
          case ClassFunCallExpr(classExpr, funCallExpr) => false
          case ClassInstantiationExpr(classType) => false

          case _: SizeOfExpr => false
          case Assign(lhs, _) => {
            if (!visit(lhs)) {
              lValueError(lhs)
              false
            } else true
          }
          case AddressofExpr(expr) => {
            if (!visit(expr)) {
              lValueError(expr)
              false
            } else true
          }
          case _: IntLiteral => false
          case _: ChrLiteral => false
          case _: StrLiteral => false
          case VarExpr(_) => true
          case FunCallExpr(_, exprs) => exprs.foreach(visit); false
          case _: Op => false
          case BinOp(lhs, _, rhs) => {
            visit(lhs)
            visit(rhs)
            false
          }
          case ArrayAccessExpr(_, _) => true
          case FieldAccessExpr(structure, _) => visit(structure)
          case TypecastExpr(_, _) => false
          case ValueAtExpr(_) => true
        }
      }
    }
  }
}
