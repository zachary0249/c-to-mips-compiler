package gen

import ast.{ClassDecl, FunDecl, Return}
import gen.asm._

/**
 *
 * @author Zachary Hayden
 *         Date: 3/8/23
 */
class FunCodeGen(val asmProg: AssemblyProgram) extends CodeGen {

  private def unescapeStr(str: String): String = {
    var res = ""
    str.foreach {
      case '\n' => res += "\\n"
      case '\t' => res += "\\t"
      case '\'' => res += "\\'"
      case '\"' => res += "\\"
      case '\\' => res += "\\"
      case '\b' => res += "\\b"
      case '\r' => res += "\\r"
      case '\f' => res += "\f"
      case a => res += a
    }
    res
  }

  def visit(fd: FunDecl, label: Label, classDecl: ClassDecl): Unit = {
    // emit string literals (if there are any stored in this function definition)
    if (fd.strLiterals.nonEmpty) {
      val dsection = asmProg.newSection(AssemblyProgram.Section.SectionType.DATA)
      fd.strLiterals.foreach(str => {
        // emit the str literal label along with its size
        dsection.emit(str.label, Directive("asciiz \"" + unescapeStr(str.str) + "\""))
        // add additional padding for 4 byte (word) alignment (if needed)
        // must take into account additional byte for the null char appended
        val padding = MemAllocCodeGen.padding(str.str.length + 1)
        if (padding != 0) {
          dsection.emit(Label.create(str.label.name + "_pad"),
                        Directive(s"space $padding"))
        }
      })

    }

    // Each function should be produced in its own section.
    // This is necessary for the register allocator.
    val section = asmProg.newSection(AssemblyProgram.Section.SectionType.TEXT)

    // emit the function label
    val fdLbl = label
    section.emit(fdLbl) // emit name of the function as label
    // attach label to the function declaration
    fd.label = fdLbl

    var stackPtrOffset = 0
    // 1) emit the prolog

    // push frame pointer onto stack
    section.emit(Comment("push frame pointer onto stack"))
    section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -4)
    stackPtrOffset += 4
    section.emit(OpCode.SW, Register.Arch.fp, Register.Arch.sp, 0)

    // initialize the frame pointer: set fp = sp
    section.emit(Comment("initialize frame pointer"))
    section.emit(OpCode.ADD, Register.Arch.fp, Register.Arch.sp, Register.Arch.zero)

    // allocate local variables
    section.emit(Comment("allocate local variables"))
    val allocator = new MemAllocCodeGen(asmProg)
    allocator.allocateLocal(fd)

    // save all saved registers onto stack
    if (fd.name != "main") {
      section.emit(Comment("save all registers needed for fn"))
      section.emit(OpCode.PUSH_REGISTERS)
    }

    // 2) emit the body of the function

    // hard code the std library functions
    fd.name match {
      case "print_s" => {
        val resReg = Register.Arch.a0
        // get the address of string from memory
        section.emit(OpCode.LW, resReg, Register.Arch.fp, fd.params.head.fpOffset.get)
        section.emit(OpCode.LI, Register.Arch.v0, 4)
        section.emit(OpCode.SYSCALL)
      }
      case "print_i" => {
        assert(fd.params.size == 1)
        val resReg = Register.Arch.a0
        // get the argument from stack
        section.emit(OpCode.LW, resReg, Register.Arch.fp, fd.params.head.fpOffset.get)
        section.emit(OpCode.LI, Register.Arch.v0, 1) // 1 is the code for int
        section.emit(OpCode.SYSCALL)
      }
      case "print_c" => {
        val resReg = Register.Arch.a0
        // get the argument from stack
        section.emit(OpCode.LW, resReg, Register.Arch.fp, fd.params.head.fpOffset.get)
        section.emit(OpCode.LI, Register.Arch.v0, 11) // 11 is the code for char
        section.emit(OpCode.SYSCALL)
      }
      case "read_c" => {
        section.emit(OpCode.LI, Register.Arch.v0, 12) // code for reading char
        section.emit(OpCode.SYSCALL)
        // copy return value in $v0 to the stack
        section.emit(OpCode.SB, Register.Arch.v0, Register.Arch.fp, fd.returnValFPOffset)
      }
      case "read_i" => {
        section.emit(OpCode.LI, Register.Arch.v0, 5) // code for read int
        section.emit(OpCode.SYSCALL)
        // copy return value in $v0 to the stack
        section.emit(OpCode.SW, Register.Arch.v0, Register.Arch.fp, fd.returnValFPOffset)
      }
      case "mcmalloc" => {
        val resReg = Register.Arch.a0
        // get the argument from stack
        section.emit(OpCode.LB, resReg, Register.Arch.fp, fd.params.head.fpOffset.get)
        section.emit(OpCode.LI, Register.Arch.v0, 9) // code for .data section expansion (heap)
        section.emit(OpCode.SYSCALL)
        // store the address of allocated heap chunk to the stack
        section.emit(OpCode.SW, Register.Arch.v0, Register.Arch.fp, fd.returnValFPOffset)
      }

      case _ => {
        section.emit(Comment(s"body of ${fd.name}:"))
        val scg = new StmtCodeGen(asmProg)
        scg.visit(fd.block)
      }
    }




    // 3) emit the epilogue

    // restore saved registers which were pushed to the stack
    if (fd.name != "main") {
      section.emit(Comment("restore saved registers from stack"))
      section.emit(OpCode.POP_REGISTERS)
    }

    // restore the stack pointer
    section.emit(Comment("restore stack pointer"))
    fd.block.vds.foreach(vd => stackPtrOffset += MemAllocCodeGen.sizeOf(vd.t))
    section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, stackPtrOffset)

    // restore the frame pointer from the stack
    section.emit(Comment("restore frame pointer from stack"))
    section.emit(OpCode.LW, Register.Arch.fp, Register.Arch.fp, 0)

    // emit jump to return address if not main function
    if (fd.name == "main") {
      // if in main function, the end of the main function is the end of the program
      section.emit(Comment("ending program"))
      section.emit(OpCode.LI, Register.Arch.v0, 10)
      section.emit(OpCode.SYSCALL)
    } else { // return to address
      section.emit(Comment("jump to return address"))
      section.emit(OpCode.JR, Register.Arch.ra)
    }
  }


  def visit(fd: FunDecl): Unit = {
    // emit string literals (if there are any stored in this function definition)
    if (fd.strLiterals.nonEmpty) {
      val dsection = asmProg.newSection(AssemblyProgram.Section.SectionType.DATA)
      fd.strLiterals.foreach(str => {
        // emit the str literal label along with its size
        dsection.emit(str.label, Directive("asciiz \"" + unescapeStr(str.str) + "\""))
        // add additional padding for 4 byte (word) alignment (if needed)
        // must take into account additional byte for the null char appended
        val padding = MemAllocCodeGen.padding(str.str.length + 1)
        if (padding != 0) {
          dsection.emit(Label.create(str.label.name + "_pad"),
                        Directive(s"space $padding"))
        }
      })

    }

    // Each function should be produced in its own section.
    // This is necessary for the register allocator.
    val section = asmProg.newSection(AssemblyProgram.Section.SectionType.TEXT)

    // emit the function label
    val fdLbl = Label.get(fd.name)
    section.emit(fdLbl) // emit name of the function as label
    // attach label to the function declaration
    fd.label = fdLbl

    var stackPtrOffset = 0
    // 1) emit the prolog

    // push frame pointer onto stack
    section.emit(Comment("push frame pointer onto stack"))
    section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, -4)
    stackPtrOffset += 4
    section.emit(OpCode.SW, Register.Arch.fp, Register.Arch.sp, 0)

    // initialize the frame pointer: set fp = sp
    section.emit(Comment("initialize frame pointer"))
    section.emit(OpCode.ADD, Register.Arch.fp, Register.Arch.sp, Register.Arch.zero)

    // allocate local variables
    section.emit(Comment("allocate local variables"))
    val allocator = new MemAllocCodeGen(asmProg)
    allocator.allocateLocal(fd)

    // save all saved registers onto stack
    if (fd.name != "main") {
      section.emit(Comment("save all registers needed for fn"))
      section.emit(OpCode.PUSH_REGISTERS)
    }

    // 2) emit the body of the function

    // hard code the std library functions
    fd.name match {
      case "print_s" => {
        val resReg = Register.Arch.a0
        // get the address of string from memory
        section.emit(OpCode.LW, resReg, Register.Arch.fp, fd.params.head.fpOffset.get)
        section.emit(OpCode.LI, Register.Arch.v0, 4)
        section.emit(OpCode.SYSCALL)
      }
      case "print_i" => {
        assert(fd.params.size == 1)
        val resReg = Register.Arch.a0
        // get the argument from stack
        section.emit(OpCode.LW, resReg, Register.Arch.fp, fd.params.head.fpOffset.get)
        section.emit(OpCode.LI, Register.Arch.v0, 1) // 1 is the code for int
        section.emit(OpCode.SYSCALL)
      }
      case "print_c" => {
        val resReg = Register.Arch.a0
        // get the argument from stack
        section.emit(OpCode.LW, resReg, Register.Arch.fp, fd.params.head.fpOffset.get)
        section.emit(OpCode.LI, Register.Arch.v0, 11) // 11 is the code for char
        section.emit(OpCode.SYSCALL)
      }
      case "read_c" => {
        section.emit(OpCode.LI, Register.Arch.v0, 12) // code for reading char
        section.emit(OpCode.SYSCALL)
        // copy return value in $v0 to the stack
        section.emit(OpCode.SB, Register.Arch.v0, Register.Arch.fp, fd.returnValFPOffset)
      }
      case "read_i" => {
        section.emit(OpCode.LI, Register.Arch.v0, 5) // code for read int
        section.emit(OpCode.SYSCALL)
        // copy return value in $v0 to the stack
        section.emit(OpCode.SW, Register.Arch.v0, Register.Arch.fp, fd.returnValFPOffset)
      }
      case "mcmalloc" => {
        val resReg = Register.Arch.a0
        // get the argument from stack
        section.emit(OpCode.LB, resReg, Register.Arch.fp, fd.params.head.fpOffset.get)
        section.emit(OpCode.LI, Register.Arch.v0, 9) // code for .data section expansion (heap)
        section.emit(OpCode.SYSCALL)
        // store the address of allocated heap chunk to the stack
        section.emit(OpCode.SW, Register.Arch.v0, Register.Arch.fp, fd.returnValFPOffset)
      }

      case _ => {
        section.emit(Comment(s"body of ${fd.name}:"))
        val scg = new StmtCodeGen(asmProg)
        scg.visit(fd.block)
      }
    }




    // 3) emit the epilogue

    // restore saved registers which were pushed to the stack
    if (fd.name != "main") {
      section.emit(Comment("restore saved registers from stack"))
      section.emit(OpCode.POP_REGISTERS)
    }

    // restore the stack pointer
    section.emit(Comment("restore stack pointer"))
    fd.block.vds.foreach(vd => stackPtrOffset += MemAllocCodeGen.sizeOf(vd.t))
    section.emit(OpCode.ADDI, Register.Arch.sp, Register.Arch.sp, stackPtrOffset)

    // restore the frame pointer from the stack
    section.emit(Comment("restore frame pointer from stack"))
    section.emit(OpCode.LW, Register.Arch.fp, Register.Arch.fp, 0)

    // emit jump to return address if not main function
    if (fd.name == "main") {
      // if in main function, the end of the main function is the end of the program
      section.emit(Comment("ending program"))
      section.emit(OpCode.LI, Register.Arch.v0, 10)
      section.emit(OpCode.SYSCALL)
    } else { // return to address
      section.emit(Comment("jump to return address"))
      section.emit(OpCode.JR, Register.Arch.ra)
    }
  }

}
