package sem

import ast.{ClassDecl, Decl, FunDecl, StructTypeDecl, VarDecl}

/**
 *
 * @author Zachary Hayden
 *         Date: 2/15/23
 */
sealed trait Symbol {
  var name: String

  def getDecl(): Decl
}

final case class FunSymbol(funDecl: FunDecl) extends Symbol {
  override var name: String = funDecl.name

  override def getDecl(): Decl = funDecl
}

final case class VarSymbol(varDecl: VarDecl) extends Symbol {
  override var name: String = varDecl.name

  override def getDecl(): Decl = varDecl
}

final case class ClassSymbol(classDecl: ClassDecl) extends Symbol {
  override var name: String = classDecl.name

  override def getDecl(): Decl = classDecl
}
