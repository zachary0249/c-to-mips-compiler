package gen

import ast.{AddressofExpr, ArrayAccessExpr, ArrayType, Assign, BinOp, ChrLiteral, ExprStmt, FieldAccessExpr, FunCallExpr, FunDecl, IntLiteral, Op, Program, SizeOfExpr, StrLiteral, StructTypeDecl, TypecastExpr, ValueAtExpr, VarDecl, VarExpr}
import gen.asm.{AssemblyPass, AssemblyProgram}
import regalloc.NaiveRegAlloc

import java.io.{File, PrintWriter}

/**
 * Creates a code generator that uses a register allocator
 *
 * @author Zachary Hayden
 *         Date: 3/6/23
 * @param registerAllocator the register allocator to use
 */
final class CodeGenerator(registerAllocator: AssemblyPass) {

  /**
   * Takes a Mini C program as an AST, turns it into a MIPS program, and writes a textual representation of that
   * program to a file.
   *
   * @param astProgram The Mini C program to turn into MIPS instructions.
   * @param outputFile The output file to write MIPS assembly code to.
   * @throws FileNotFoundException If {@code outputFile} does not denote an existing, writable regular file and a new
   *                               regular file of that name cannot be created, or if some other error occurs while opening or creating the file.
   */

  def emitProgram(astProgram: Program, outputFile: File): Unit = {

    // generate an assembly program with the code generator// generate an assembly program with the code generator
    val asmProgWithVirtualRegs: AssemblyProgram = new AssemblyProgram
    val progGen: ProgramCodeGen = new ProgramCodeGen(asmProgWithVirtualRegs)
    progGen.generate(astProgram)

    // run the register allocator which remove the virtual registers (unless there is no register allocator)
    val asmProgAfterRegAlloc: AssemblyProgram = registerAllocator.apply(asmProgWithVirtualRegs)

    // print the assembly program
    val writer: PrintWriter = new PrintWriter(outputFile)
    asmProgAfterRegAlloc.print(writer)
    writer.close()

  }

}

object CodeGenerator {
  /**
   * Creates a code generator that relies on the default register allocator.
   *
   * @note To use your custom register allocator by default, replace {@code NaiveRegAlloc.INSTANCE} with an
   *       instance of your register allocator pass for part 4.
   * @return
   */
  def apply(): CodeGenerator = new CodeGenerator(NaiveRegAlloc)
}