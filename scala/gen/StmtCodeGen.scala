package gen

import ast._
import gen.asm.{AssemblyProgram, Label, OpCode, Register}

/**
 *
 * @author Zachary Hayden
 *         Date: 3/8/23
 */
class StmtCodeGen(val asmProg: AssemblyProgram) extends CodeGen {
  private val section = asmProg.getCurrentSection
  private val exprCodeGen = new ExprCodeGen(asmProg)

  def visit(s: Stmt): Unit = {
    s match {
      case ExprStmt(expr) => exprCodeGen.visit(expr)
      case ret: Return => {
        if (ret.stmt.nonEmpty) {
          section.emit("return statement")
          // if the return expr is a struct the address of it will be returned
          val retReg = exprCodeGen.visit(ret.stmt.get)
          // copying return value onto stack
          section.emit(MemAllocCodeGen.storeOpCodeFromType(ret.stmt.get.t), retReg, Register.Arch.fp, ret.funDecl.returnValFPOffset)
        }
      }
      case If(conditionExpr, ifStmt, elseStmt) => {
        section.emit("if " + conditionExpr + " then")
        val condReg = new ExprCodeGen(asmProg).visit(conditionExpr)

        val elseLbl = Label.create("else")
        val endLbl = Label.create("end")

        section.emit(OpCode.BEQ, condReg, Register.Arch.zero, elseLbl)

        visit(ifStmt)
        section.emit(OpCode.J, endLbl)

        section.emit(elseLbl)
        if (elseStmt.nonEmpty) {
          section.emit("else:")
          visit(elseStmt.get)
        }

        section.emit(endLbl)
      }
      case While(loopExpr, doStatement) => {
        section.emit("loop while: " + loopExpr)
        var condReg = exprCodeGen.visit(loopExpr)
        val nextLbl = Label.create("next")
        val bodyLbl = Label.create("body")
        section.emit(OpCode.BEQZ, condReg, nextLbl)

        section.emit(bodyLbl)
        visit(doStatement)
        condReg = exprCodeGen.visit(loopExpr) // TODO: do i need to re-collect this bc it might be altered in the body?
        section.emit(OpCode.BNEZ, condReg, bodyLbl)

        section.emit(nextLbl)
      }
      case Block(_, stmts) => {
        // no need to do anything with varDecls (memory allocator takes care of them)
        stmts.foreach(visit)
      }
    }
  }
}
