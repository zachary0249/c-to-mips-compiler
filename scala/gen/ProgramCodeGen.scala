package gen

import ast.{ClassDecl, Decl, FunDecl, Program, StructTypeDecl, VarDecl}
import gen.asm.{AssemblyProgram, ClassCodeGen, Label, OpCode}

/**
 *
 * @author Zachary Hayden
 *         Date: 3/8/23
 */
class ProgramCodeGen(val asmProg: AssemblyProgram) extends CodeGen {
  private val dataSection = asmProg.newSection(AssemblyProgram.Section.SectionType.DATA)

  def generate(p: Program): Unit = {
    // allocate all variables// allocate all variables
    val allocator = new MemAllocCodeGen(asmProg)
    allocator.allocateGlobal(p.decls)

    // if program contains main function then should jump to that first
    if (p.decls.collectFirst({case funDecl: FunDecl if funDecl.name == "main" => true; case _ => false}).nonEmpty) {
      val txtSection = asmProg.newSection(AssemblyProgram.Section.SectionType.TEXT)
      txtSection.emit(OpCode.JAL, Label.get("main"))
    }


//    // for the class decls emit the virtual tables
//    p.decls.filter(_.isInstanceOf[ClassDecl]).map(_.asInstanceOf[ClassDecl]).foreach(cd => {
//      val globalSection = asmProg.newSection(AssemblyProgram.Section.SectionType.TEXT)
//      cd.funDecls.foreach(fd => {
//
//      })
//    })

    // generate the code for each function
    p.decls.foreach {
      case classDecl: ClassDecl => {
        val ccg = new ClassCodeGen(asmProg)
        ccg.visit(classDecl)
      }
      case funDecl: FunDecl => {
        val fcg = new FunCodeGen(asmProg)
        fcg.visit(funDecl)
      }
      case StructTypeDecl(structType, varDecls) =>
      case VarDecl(t, name) =>
      case _ => // do nothing

      // nothing to do
    }
  }
}
