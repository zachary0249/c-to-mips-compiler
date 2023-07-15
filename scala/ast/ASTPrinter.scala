package ast

import java.io.PrintWriter

/**
 * CURRENT TESTS: 86/102
 * @param writer print writer for file output
 */
class ASTPrinter(private val writer: PrintWriter) {

  def visit(node: ASTNode): Unit = {
    node match {
      case null => throw new IllegalStateException("Unexpected null value")

      case Block(vds, stmts) =>
        writer.print("\n\tBlock(")
        var delim = ""
        for (vd <- vds) {
          writer.print(delim)
          delim = ", "
          visit(vd)
        }

        delim = if (vds.nonEmpty) ", " else ""
        for (stmt <- stmts) {
          writer.print(delim)
          delim = ", "
          visit(stmt)
        }

        writer.print(")")

      case FunDecl(t, name, params, block) =>
        writer.print("FunDecl(")
        visit(t)
        writer.print(", " + name + ", ")
        for (vd <- params) {
          visit(vd)
          writer.print(", ")
        }
        visit(block)
        writer.print(")")

      case Program(decls) =>
        writer.print("Program(\n")
        var delimiter = ""
        for (d <- decls) {
          writer.print(delimiter)
          delimiter = ", "
          visit(d)
        }
        writer.print("\n)")
        writer.flush()

      case StructTypeDecl(t, varDecls) =>
        writer.print("StructTypeDecl(")
        visit(t)
        writer.print(", ")
        var delim = ""
        for (vd <- varDecls) {
          writer.print(delim)
          delim = ", "
          visit(vd)
        }
        writer.print(")")

      case PointerType(t) =>
        writer.print("PointerType(")
        visit(t)
        writer.print(" )")

      case StructType(name) =>
        writer.print(s"StructType( $name )")

      case ArrayType(t, size) =>
        writer.print("ArrayType(")
        visit(t)
        writer.print(", ")
        writer.print(size + ")")


      case VarDecl(t, name) =>
        writer.print("VarDecl(")
        visit(t)
        writer.print(", " + name)
        writer.print(")")

      case VarExpr(name) =>
        writer.print("VarExpr(")
        writer.print(name)
        writer.print(")")

      // base types
      case BaseType.NONE => writer.print("NONE")
      case BaseType.INT => writer.print("INT")
      case BaseType.UNKNOWN => writer.print("UNKNOWN")
      case BaseType.CHAR => writer.print("CHAR")
      case BaseType.VOID => writer.print("VOID")

      // expressions
      case IntLiteral(x) => writer.print(s"IntLiteral($x)")
      case StrLiteral(str) => writer.print(s"StrLiteral($str)")
      case ChrLiteral(c) => writer.print(s"ChrLiteral($c)")
      case FunCallExpr(name, exprs) =>
        writer.print(s"FunCallExpr($name")
        val delim = ", "
        for (expr <- exprs) {
          writer.print(delim)
          visit(expr)
        }
        writer.print(")")

      case BinOp(lhs, op, rhs) =>
        writer.print("BinOp(")
        visit(lhs)
        writer.print(", ")
        visit(op)
        writer.print(", ")
        visit(rhs)
        writer.print(")")


      case ADD => writer.print("ADD")
      case SUB => writer.print("SUB")
      case MUL => writer.print("MUL")
      case DIV => writer.print("DIV")
      case MOD => writer.print("MOD")
      case GT => writer.print("GT")
      case LT => writer.print("LT")
      case GE => writer.print("GE")
      case LE => writer.print("LE")
      case NE => writer.print("NE")
      case EQ => writer.print("EQ")
      case OR => writer.print("OR")
      case AND => writer.print("AND")

      case ArrayAccessExpr(arr, index) =>
        writer.print("ArrayAccessExpr(")
        visit(arr)
        writer.print(", ")
        visit(index)
        writer.print(")")

      case FieldAccessExpr(structure, name) =>
        writer.print("FieldAccessExpr(")
        visit(structure)
        writer.print(s", $name)")

      case ValueAtExpr(expr) =>
        writer.print("ValueAtExpr(")
        visit(expr)
        writer.print(")")

      case AddressofExpr(expr) =>
        writer.print("AddressofExpr(")
        visit(expr)
        writer.print(")")

      case SizeOfExpr(typeSize) =>
        writer.print("SizeOfExpr(")
        visit(typeSize)
        writer.print(")")

      case TypecastExpr(castType, expr) =>
        writer.print("TypecastExpr(")
        visit(castType)
        writer.print(", ")
        visit(expr)
        writer.print(")")

      case Assign(lhs, rhs) =>
        writer.print("Assign(")
        visit(lhs)
        writer.print(", ")
        visit(rhs)
        writer.print(")")

      case While(loopExpr, doStatement) =>
        writer.print("While(")
        visit(loopExpr)
        writer.print(", ")
        visit(doStatement)
        writer.print(")")

      case If(conditionExpr, ifStmt, elseStmt) =>
        writer.print("If(")
        visit(conditionExpr)
        writer.print(", ")
        visit(ifStmt)

        if (elseStmt.nonEmpty) {
          writer.print(", ")
          visit(elseStmt.get)
        }

        writer.print(")")

      case Return(stmt) =>
        if (stmt.nonEmpty) {
          writer.print("Return(")
          visit(stmt.get)
          writer.print(")")
        }
        else writer.print("Return()")

      case ExprStmt(expr) =>
        writer.print("ExprStmt(")
        visit(expr)
        writer.print(")")
    }
  }

  private def parseOp(op: Op): String = {
    op match {
      case ADD => "+"
      case SUB => "-"
      case MUL => "*"
      case DIV => "/"
      case MOD => "%"
      case GT => ">"
      case LT => "<"
      case GE => ">="
      case LE => "<="
      case NE => "!="
      case EQ => "=="
      case OR => "||"
      case AND => "&&"
    }
  }
}
