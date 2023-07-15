package ast

import gen.MemAllocCodeGen
import gen.asm.Label

import scala.collection.mutable


/*
###############################################################################################
AST NODES
###############################################################################################
 */

sealed trait ASTNode

final case class Program(decls: mutable.Buffer[Decl]) extends ASTNode


/*
###############################################################################################
TYPES
###############################################################################################
 */

sealed trait Type extends ASTNode


// base type enum type
object BaseType extends Enumeration {
  protected class BaseTypeVal extends Val with Type {

  }

  protected final def baseTypeVal() = new BaseTypeVal()

  val INT, CHAR, VOID, UNKNOWN, NONE, INVALID = baseTypeVal()
}

final case class StructType(name: String) extends Type {
  // this gets filled in during name analysis for use in type analysis
  var structDecl: StructTypeDecl = _

  val varOffsetMap: mutable.Map[VarDecl, Int] = mutable.Map.empty

  var label: Option[Label] = None
}

final case class PointerType(t: Type) extends Type {

}

final case class ArrayType(t: Type, size: Int) extends Type {

}

final case class ClassType(name: String) extends Type {
  var classDecl: ClassDecl = _ // to be filled in during name analysis
  var label: Option[Label] = None

  var virtualTable: mutable.LinkedHashMap[String, Label] = _ // filled in during memory allocation of class instantiation

  val varOffsetMap: mutable.Map[VarDecl, Int] = mutable.Map.empty
}

/*
###############################################################################################
STATEMENTS
###############################################################################################
 */

sealed trait Stmt extends ASTNode

final case class ExprStmt(expr: Expr) extends Stmt

final case class Return(stmt: Option[Expr]) extends Stmt {
  private var _funDecl: FunDecl = _ // to be filled in during

  def funDecl: FunDecl = _funDecl

  def funDecl_=(newFunDecl: FunDecl): Unit = {
    assert(newFunDecl != null)
    _funDecl = newFunDecl
  }
}

final case class If(conditionExpr: Expr, ifStmt: Stmt, elseStmt: Option[Stmt]) extends Stmt

final case class While(loopExpr: Expr, doStatement: Stmt) extends Stmt

final case class Block(vds: mutable.Buffer[VarDecl], stmts: mutable.Buffer[Stmt]) extends Stmt

/*
###############################################################################################
DECLARATIONS
###############################################################################################
 */

sealed trait Decl extends ASTNode {
  val t: Type
  val name: String
}

/**
 *
 * @param t      type of the function
 * @param name   name of the function declaration
 * @param params parameters for function
 * @param block  block composing the functions behavior
 */
final case class FunDecl(t: Type, name: String, params: mutable.Buffer[VarDecl], block: Block) extends Decl {
  private var _returnValFPOffset: Int = 0 // filled in during memory allocation
  val returnSize: Int = MemAllocCodeGen.sizeOf(t)
  private var _label: Label = _ // label filled in during memory allocation
  // str literals to be filled in during global memory allocation, then emitted during local memory
  var strLiterals: mutable.Buffer[StrLiteral] = mutable.ArrayBuffer.empty


  def label: Label = _label

  def returnValFPOffset: Int = _returnValFPOffset


  def returnValFPOffset_=(newOffset: Int): Unit = {
    _returnValFPOffset = newOffset
  }

  def label_=(newLabel: Label): Unit = {
    assert(newLabel != null)
    _label = newLabel
  }
}

/**
 *
 * @param structType name of the struct
 * @param varDecls   variable declarations in struct
 */
final case class StructTypeDecl(structType: StructType, varDecls: mutable.Buffer[VarDecl]) extends Decl {

  override val t: Type = structType
  override val name: String = structType.name
}

final case class ClassDecl(classType  : ClassType,
                           parentClass: Option[ClassType],
                           varDecls   : mutable.Buffer[VarDecl],
                           funDecls   : mutable.Buffer[FunDecl]) extends Decl {
  override val t: Type = classType
  override val name: String = classType.name
}

/**
 *
 * @param t    type of the variable
 * @param name name of the variable
 */
final case class VarDecl(t: Type, name: String) extends Decl {
  private var _label: Option[Label] = None
  private var _fpOffset: Option[Int] = None

  var fieldOf: Option[ClassDecl] = None // filled in during name analysis

  // indicates if is local variable and should be stored in virtual register rather than stack
  var promoteLocalToVirtualReg: Boolean = false // filled in during parsing

  def label: Option[Label] = _label

  def fpOffset: Option[Int] = _fpOffset

  def label_=(newLabel: Option[Label]): Unit = {
    assert(newLabel != null)
    _label = newLabel
  }

  def fpOffset_=(newOffset: Option[Int]): Unit = {
    _fpOffset = newOffset
  }
}


/*
###############################################################################################
EXPRESSIONS
###############################################################################################
 */
sealed trait Expr extends ASTNode {
  var t: Type = _ // to be filled in by the type analyzer
}

final case class ClassFunCallExpr(classExpr: Expr, funCallExpr: FunCallExpr) extends Expr {
  var classDecl: ClassDecl = _ // class type to be tagged during name analysis for use in code gen
}

final case class ClassInstantiationExpr(classType: ClassType) extends Expr

final case class SizeOfExpr(typeSize: Type) extends Expr

final case class Assign(lhs: Expr, rhs: Expr) extends Expr

final case class AddressofExpr(expr: Expr) extends Expr

final case class IntLiteral(x: Int) extends Expr

final case class ChrLiteral(c: Char) extends Expr

final case class StrLiteral(str: String) extends Expr {
  var label: Label = _ // label to be filled in during global memory allocation of function
}

/**
 *
 * @param name name of the variable
 */
final case class VarExpr(name: String) extends Expr {
  var varDecl: VarDecl = _ // to be filled in by the name analyzer

}

/**
 *
 * @param name name of the function being called
 * @param args the arguments to function
 */
final case class FunCallExpr(name: String, args: mutable.Buffer[Expr]) extends Expr {
  var funDecl: FunDecl = _
}


sealed trait Op extends Expr

case object ADD extends Op

case object SUB extends Op

case object MUL extends Op

case object DIV extends Op

case object MOD extends Op

case object GT extends Op

case object LT extends Op

case object GE extends Op

case object LE extends Op

case object NE extends Op

case object EQ extends Op

case object OR extends Op

case object AND extends Op

final case class BinOp(lhs: Expr, op: Op, rhs: Expr) extends Expr

/**
 *
 * @param arr   the array
 * @param index the index ex [Expr]
 */
final case class ArrayAccessExpr(arr: Expr, index: Expr) extends Expr

final case class FieldAccessExpr(structure: Expr, name: String) extends Expr {
  var classDecl: Option[ClassDecl] = None
}

final case class TypecastExpr(castType: Type, expr: Expr) extends Expr

final case class ValueAtExpr(expr: Expr) extends Expr