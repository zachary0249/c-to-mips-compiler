package sem

import ast.{ASTNode, Type}

/**
 * A base class providing basic error accumulation.
 */
trait BaseSemanticAnalyzer {
  private var _errors = 0

  def errors: Int = _errors

  private def incrError(): Unit = {
    _errors += 1
    throw new SemanticException
  }

  protected def error(message: String): Unit = {
    System.err.println(s"semantic error: $message")
    incrError()
  }

  protected def lValueError(lvalue: ASTNode): Unit = {
    System.err.println(
      s"semantic error: invalid lvalue $lvalue found. Left-values must only be of: VarExpr, ArrayAccessExpr, ValueAtExpr and FieldAccessExpr. Note that a FieldAccessExpr is an lvalue only if the first expression(the structure you are accessing) is itself an lvalue.")
    incrError()
  }

  protected def alreadyInScopeError(name: String): Unit = {
    System.err.println(s"semantic error: $name already defined in current scope")
    incrError()
  }

  protected def notInScopeError(name: String): Unit = {
    System.err.println(s"semantic error: $name used but not defined in scope")
    incrError()
  }

  protected def typeMismatchError(expected: Type, found: Type*): Unit = {
    System.err.println(s"semantic error: found $found but expected $expected")
    incrError()
  }

  /**
   * Used when NE | EQ is used with operands that can not be directly compared for (in)equality
   */
  protected def invalidOpOperandsError(): Unit = {
    System.err.println("semantic error: used (== | !=) with unsupported operands")
    incrError()
  }

  protected def voidTypeError(): Unit = {
    System.err.println("semantic error: illegal void type found")
    incrError()
  }

}
