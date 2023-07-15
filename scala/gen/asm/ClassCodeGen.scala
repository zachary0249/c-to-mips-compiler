package gen.asm

import ast.ClassDecl
import gen.{CodeGen, FunCodeGen}

/**
 *
 * @author Zachary Hayden
 *         Date: 4/22/23
 */
class ClassCodeGen(val asmProg: AssemblyProgram) extends CodeGen {
  /**
   * Emits the functions and virtual table associated with the class declaration
   *
   * @param classDecl class declaration to generate asm code for
   */
  def visit(classDecl: ClassDecl): Unit = {
    val section = asmProg.newSection(AssemblyProgram.Section.SectionType.TEXT)


    val funDeclCodeGen = new FunCodeGen(asmProg)
    // here we assume if there's a function name in the VT that's not in this class decl it's already been defined
    classDecl.funDecls.foreach(fd => {
      // visit and emit code for the function
      funDeclCodeGen.visit(fd, fd.label, classDecl)

      // store the address of the implemented function in the vtable for the class
      val fnAddr = Register.Virtual.create()
      val vtable = Register.Virtual.create()
      // get the dynamically dispatched function label for this class in context of its super classes
      val dynDispFnLbl = classDecl.classType.virtualTable(fd.name)
      val dynDispatchFnOffset = {
        val tmp = classDecl.classType.virtualTable.zipWithIndex
        tmp((fd.name, dynDispFnLbl)) * 4 // gets the address offset from base of class vtable
      }
      section.emit(OpCode.LA, fnAddr, dynDispFnLbl)
      section.emit(OpCode.LA, vtable, classDecl.classType.label.get)
      section.emit(OpCode.SW, fnAddr, vtable, dynDispatchFnOffset)
    })

    if (classDecl.funDecls.nonEmpty) {
      // store pointer to first method in vtable in the first word of the classes memory allocation
      val clsAddr = Register.Virtual.create()
      section.emit(OpCode.LA, clsAddr, classDecl.classType.label.get)
      // get pointer to head of vtable
      val vtablePtr = Register.Virtual.create()
      section.emit(OpCode.LA, vtablePtr, classDecl.classType.virtualTable.head._2)
      // store pointer in first word of class memory
      section.emit(OpCode.SW, vtablePtr, clsAddr, 0)
    }
  }
}
