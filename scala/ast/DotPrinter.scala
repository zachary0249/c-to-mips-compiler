package ast

import java.io.PrintWriter

/**
 *
 * @author Zachary Hayden
 *         Date: 2/18/23
 */
class DotPrinter(writer: PrintWriter) extends ASTPrinter(writer) {
  private var _nodeCnt = 0

  private def nodeCnt: Int = {
    val tmp = _nodeCnt
    _nodeCnt += 1
    tmp
  }

  private def nodeId(): String = {
    "Node" + nodeCnt
  }

  private def createLabel(name: String): String = {
    "[label=\"" + name + "\"];"
  }

  private def createEdge(parent: String, child: String): Unit = {
    writer.println(parent + "->" + child + ";")
  }

  private def createNode(labelName: String): String = {
    val ret = nodeId()
    writer.println(ret + createLabel(labelName))
    ret
  }

  override def visit(node: ASTNode): Unit = trace(node)


  private def trace(n: ASTNode): String = {
    n match {
      case null => throw new IllegalStateException("Unexpected null value")

      case Block(vds, stmts) => {
        val blockNodeId = createNode("Block")

        // traverse children
        for (vd <- vds) {
          val vdNodeId = trace(vd)
          createEdge(blockNodeId, vdNodeId)
        }

        for (stmt <- stmts) {
          val stmtNodeId = trace(stmt)
          createEdge(blockNodeId, stmtNodeId)
        }
        blockNodeId
      }
      case FunDecl(t, name, params, block) => {
        val funDeclNodeId = createNode("FunDecl(" + name + ")")
        val typeNodeId = trace(t)
        createEdge(funDeclNodeId, typeNodeId)

        // traverse children
        for (vd <- params) {
          val vdNodeId = trace(vd)
          createEdge(funDeclNodeId, vdNodeId)
        }
        val blockNodeId = trace(block)
        createEdge(funDeclNodeId, blockNodeId)
        funDeclNodeId
      }
      case Program(decls) => {
        writer.println("digraph ast {")
        val programNodeId = createNode("Program")
        for (d <- decls) {
          val declNodeId = trace(d)
          createEdge(programNodeId, declNodeId)
        }

        writer.print("\n}")
        writer.flush()
        programNodeId
      }
      case StructTypeDecl(t, varDecls) => {
        val structTypeDeclNodeId = createNode("StructTypeDecl")
        createEdge(structTypeDeclNodeId, trace(t))

        for (vd <- varDecls) {
          val vdNodeId = trace(vd)
          createEdge(structTypeDeclNodeId, vdNodeId)
        }
        structTypeDeclNodeId
      }
      case PointerType(t) => {
        val pointerTypeNodeId = createNode("PointerType")
        createEdge(pointerTypeNodeId, trace(t))
        pointerTypeNodeId
      }
      case StructType(name) => createNode("StructType(" + name + ")")

      case ArrayType(t, size) => {
        val arrayTypeNodeId = createNode("ArrayType[" + size + "]")
        createEdge(arrayTypeNodeId, trace(t))
        arrayTypeNodeId
      }
      case VarDecl(t, name) => {
        val varDeclNodeId = createNode("VarDecl(" + name + ")")
        createEdge(varDeclNodeId, trace(t))
        varDeclNodeId
      }
      case VarExpr(name) => createNode("VarExpr(" + name + ")")

      // base types
      case BaseType.NONE => createNode("NONE")
      case BaseType.INT => createNode("INT")
      case BaseType.UNKNOWN => createNode("UNKNOWN")
      case BaseType.CHAR => createNode("CHAR")
      case BaseType.VOID => createNode("VOID")

      // expressions
      case IntLiteral(x) => createNode("IntLit(" + x + ")")
      case StrLiteral(str) => createNode(s"StrLit($str)")
      case ChrLiteral(c) => createNode(s"ChrLit( $c )")
      case FunCallExpr(name, exprs) => {
        val funCallExprNodeId = createNode("FunCallExpr(" + name + ")")
        for (expr <- exprs) {
          val exprNodeId = trace(expr)
          createEdge(funCallExprNodeId, exprNodeId)
        }
        funCallExprNodeId
      }
      case BinOp(lhs, op, rhs) => {
        val binOpNodeId = createNode("BinOp")
        createEdge(binOpNodeId, trace(lhs))
        createEdge(binOpNodeId, trace(op))
        createEdge(binOpNodeId, trace(rhs))
        binOpNodeId
      }
      case ADD => createNode("+")
      case SUB => createNode("-")
      case MUL => createNode("*")
      case DIV => createNode("/")
      case MOD => createNode("%")
      case GT => createNode(">")
      case LT => createNode("<")
      case GE => createNode(">=")
      case LE => createNode("<=")
      case NE => createNode("!=")
      case EQ => createNode("==")
      case OR => createNode("||")
      case AND => createNode("&&")

      case ArrayAccessExpr(arr, index) => {
        val arrayAccessExprNodeId = createNode("ArrayAccessExpr")
        createEdge(arrayAccessExprNodeId, trace(arr))
        createEdge(arrayAccessExprNodeId, trace(index))
        arrayAccessExprNodeId
      }
      case FieldAccessExpr(structure, name) => {
        val fieldAccessExprNodeId = createNode("FieldAccessExpr(" + name + ")")
        createEdge(fieldAccessExprNodeId, trace(structure))
        fieldAccessExprNodeId
      }
      case ValueAtExpr(expr) => {
        val valueAtExprNodeId = createNode("ValueAtExpr")
        createEdge(valueAtExprNodeId, trace(expr))
        valueAtExprNodeId
      }
      case AddressofExpr(expr) => {
        val addressofExprNodeId = createNode("AddressofExpr")
        createEdge(addressofExprNodeId, trace(expr))
        addressofExprNodeId
      }
      case SizeOfExpr(typeSize) => {
        val sizeOfExprNodeId = createNode("SizeOfExpr")
        createEdge(sizeOfExprNodeId, trace(typeSize))
        sizeOfExprNodeId
      }
      case TypecastExpr(castType, expr) => {
        val typecastExprNodeId = createNode("TypecastExpr")
        createEdge(typecastExprNodeId, trace(castType))
        createEdge(typecastExprNodeId, trace(expr))
        typecastExprNodeId
      }
      case Assign(lhs, rhs) => {
        val assignNodeId = createNode("Assign")
        createEdge(assignNodeId, trace(lhs))
        createEdge(assignNodeId, trace(rhs))
        assignNodeId
      }
      case While(loopExpr, doStatement) => {
        val whileNodeId = createNode("While")
        createEdge(whileNodeId, trace(loopExpr))
        createEdge(whileNodeId, trace(doStatement))
        whileNodeId
      }
      case If(conditionExpr, ifStmt, elseStmt) => {
        val ifNodeId = createNode("If")
        createEdge(ifNodeId, trace(conditionExpr))
        createEdge(ifNodeId, trace(ifStmt))
        if (elseStmt.nonEmpty) createEdge(ifNodeId, trace(elseStmt.get))
        ifNodeId
      }
      case Return(stmt) => {
        val returnNodeId = createNode("Return")
        if (stmt.nonEmpty) createEdge(returnNodeId, trace(stmt.get))
        returnNodeId
      }
      case ExprStmt(expr) => {
        val exprStmtNodeId = createNode("ExprStmt")
        createEdge(exprStmtNodeId, trace(expr))
        exprStmtNodeId
      }
    }
  }

}
