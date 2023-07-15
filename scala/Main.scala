/**
 *
 * @author Zachary Hayden
 *         Date: 3/1/23
 */

import ast.{ASTPrinter, DotPrinter, Program}
import gen.CodeGenerator
import gen.asm.AssemblyProgram.Section.SectionType
import gen.asm.{AssemblyParser, AssemblyPass, AssemblyProgram}
import lexer.{Scanner, TokenClass, Tokenizer}
import parser.Parser
import regalloc.{CFGDotPrinter, GraphColouringRegAlloc, NaiveRegAlloc}
import sem.SemanticAnalyzer

import java.io._
import scala.io.Source
import scala.language.postfixOps
import scala.sys.process._

/**
 * This is the entry point to the compiler. This files should not be modified.
 */
object Main {
  private val FILE_NOT_FOUND: Int = 2
  private val IO_EXCEPTION: Int = 3
  private val MODE_FAIL: Int = 254
  private val LEXER_FAIL: Int = 250
  private val PARSER_FAIL: Int = 245
  private val SEM_FAIL: Int = 240
  private val PASS: Int = 0

  private object Mode extends Enumeration {
    type Mode = Value
    val LEXER, PARSER, AST, DOT, SEMANTICANALYSIS, GEN, REGALLOC, CFGDOT = Value
  }

  private object RegAllocMode extends Enumeration {
    type RegAllocMode = Value
    val NONE, NAIVE, GRAPH_COLOURING = Value
  }

  private def usage(): Unit = {
    System.out.println("Usage: java Main pass inputfile [outputfile]")
    System.out.println("where pass is either: -lexer, -parser, -ast, -sem, -gen [naive|colour], -regalloc naive|colour, -cfgdot")
    System.out.println("if -ast, -gen, -cfgdot, or -regalloc is chosen, the output file must be specified")
    System.exit(-(1))
  }

  private def ensureArgExists(args: Array[String], num: Int): Unit = {
    if (num >= args.length) usage()
  }

  @throws[FileNotFoundException]
  def main(args: Array[String]): Unit = {
    ensureArgExists(args, 0)
    var mode: Main.Mode.Mode = null
    var regAllocMode: Main.RegAllocMode.RegAllocMode = RegAllocMode.NONE
    var curArgCnt: Int = 0
    args(curArgCnt) match {
      case "-lexer" => {
        mode = Mode.LEXER
        curArgCnt += 1
      }
      case "-parser" => {
        mode = Mode.PARSER
        curArgCnt += 1
      }
      case "-ast" => {
        if (args.length < 3) {
          usage()
        }
        mode = Mode.AST
        curArgCnt += 1
      }
      case "-sem" => {
        mode = Mode.SEMANTICANALYSIS
        curArgCnt += 1
      }
      case "-gen" => {
        mode = Mode.GEN
        curArgCnt += 1
        ensureArgExists(args, curArgCnt)
        if (args(curArgCnt) == ("naive")) {
          regAllocMode = RegAllocMode.NAIVE
          curArgCnt += 1
        } else if (args(curArgCnt) == "colour") {
          regAllocMode = RegAllocMode.GRAPH_COLOURING
          curArgCnt += 1
        }
      }
      case "-regalloc" => {
        mode = Mode.REGALLOC
        curArgCnt += 1
        ensureArgExists(args, curArgCnt)
        if (args(curArgCnt) == "naive") {
          regAllocMode = RegAllocMode.NAIVE
          curArgCnt += 1
        } else if (args(curArgCnt) == "colour") {
          regAllocMode = RegAllocMode.GRAPH_COLOURING
          curArgCnt += 1
        }
      }
      case "-cfgdot" => {
        mode = Mode.CFGDOT
        curArgCnt += 1
      }
      case _ => {
        usage()
      }
    }
    ensureArgExists(args, curArgCnt)

    val inputFileFile = new File(args(curArgCnt))
    if (!inputFileFile.exists()) {
      System.out.println("File " + args(curArgCnt) + " does not exist.")
      System.exit(FILE_NOT_FOUND)
      return
    }

    val inputFile = Source.fromFile(args(curArgCnt))
    curArgCnt += 1
    val scanner = new Scanner(inputFile)
    val tokenizer = new Tokenizer(scanner)

    if (mode == Mode.LEXER) {
      var t = tokenizer.nextToken()
      while (t.tokenClass ne TokenClass.EOF) {
        System.out.println(t)
        t = tokenizer.nextToken()
      }
      if (tokenizer.getErrorCount == 0) System.out.println("Lexing: pass")
      else System.out.println("Lexing: failed (" + tokenizer.getErrorCount + " errors)")
      System.exit(if (tokenizer.getErrorCount == 0) PASS
                  else LEXER_FAIL)
    }
    else if (mode == Mode.PARSER) {
      val parser = new Parser(tokenizer)
      parser.parse()
      if (parser.getErrorCount == 0) System.out.println("Parsing: pass")
      else System.out.println("Parsing: failed (" + parser.getErrorCount + " errors)")
      System.exit(if (parser.getErrorCount == 0) PASS
                  else PARSER_FAIL)
    } else if (mode == Mode.AST) {
      ensureArgExists(args, curArgCnt)
      val outputFile = new File(args(curArgCnt))
      curArgCnt += 1
      val parser = new Parser(tokenizer)
      val programAst = parser.parse()
      if (parser.getErrorCount == 0) {
        val writer = new PrintWriter(outputFile)
        new ASTPrinter(writer).visit(programAst)
        writer.close()
      }
      else System.out.println("Parsing: failed (" + parser.getErrorCount + " errors)")
      System.exit(if (parser.getErrorCount == 0) PASS
                  else PARSER_FAIL)
    } else if (mode == Mode.DOT) {
      val parser = new Parser(tokenizer)
      val programAst: Program = parser.parse()
      if (parser.getErrorCount == 0) {
        val outputFile = new File(args(2))
        val writer = new PrintWriter(outputFile)
        new DotPrinter(writer).visit(programAst)
        writer.close()

        // compile the dot file output
        val dotOutPutFileName = outputFile.getPath.replaceAll("(?<!^)[.].*", "")
        val dotCompileExitCode = s"dot -Tpdf $outputFile -o $dotOutPutFileName.pdf" !;
        println("Dot production exit code: " + dotCompileExitCode)
      }
      else System.out.println("Parsing: failed (" + parser.getErrorCount + " errors)")
      System.exit(if (parser.getErrorCount == 0) PASS
                  else PARSER_FAIL)

    } else if (mode == Mode.SEMANTICANALYSIS) {
      val parser = new Parser(tokenizer)
      val programAst = parser.parse()
      if (parser.getErrorCount == 0) {
        val sem = new SemanticAnalyzer
        val errors = sem.analyze(programAst)
        if (errors == 0) System.out.println("Semantic analysis: Pass")
        else System.out.println("Semantic analysis: Failed (" + errors + ")")
        System.exit(if (errors == 0) PASS
                    else SEM_FAIL)
      }
      else System.exit(PARSER_FAIL)
    } else if (mode == Mode.GEN) {
      ensureArgExists(args, curArgCnt)
      val outputFile = new File(args(curArgCnt))
      curArgCnt += 1
      val parser = new Parser(tokenizer)
      val programAst = parser.parse()
      if (parser.getErrorCount > 0) System.exit(PARSER_FAIL)
      val sem = new SemanticAnalyzer
      val errors = sem.analyze(programAst)
      if (errors > 0) System.exit(SEM_FAIL)
      val regAlloc: AssemblyPass = regAllocMode match {
        case RegAllocMode.NONE => AssemblyPass.NOP
        case RegAllocMode.NAIVE => NaiveRegAlloc
        case RegAllocMode.GRAPH_COLOURING => GraphColouringRegAlloc
      }
      val codegen = new CodeGenerator(regAlloc)
      try codegen.emitProgram(programAst, outputFile)
      catch {
        case e: FileNotFoundException =>
          System.out.println("File " + outputFile.toString + " does not exist.")
          System.exit(FILE_NOT_FOUND)
      }
    } else if (mode == Mode.REGALLOC) {
      ensureArgExists(args, curArgCnt)
      val outputFile = new File(args(curArgCnt))
      curArgCnt += 1

      val regAlloc: AssemblyPass = regAllocMode match {
        case RegAllocMode.NONE => AssemblyPass.NOP
        case RegAllocMode.NAIVE => NaiveRegAlloc
        case RegAllocMode.GRAPH_COLOURING => GraphColouringRegAlloc
      }

      var program: AssemblyProgram = null
      try {
        val reader = new FileReader(inputFileFile)
        program = AssemblyParser.readAssemblyProgram(Source.fromFile(inputFileFile))
        reader.close()
      } catch {
        case e: FileNotFoundException =>
          System.out.println("File " + inputFile + " does not exist.")
          System.exit(FILE_NOT_FOUND)
          return
        case e: IOException =>
          System.out.println("An I/O exception occurred when reading " + inputFile + ".")
          System.exit(IO_EXCEPTION)
          return
      }

      val programWithoutVRegs = regAlloc.apply(program)

      var writer: PrintWriter = null
      try writer = new PrintWriter(outputFile)
      catch {
        case e: FileNotFoundException =>
          System.out.println("Cannot write to output file " + outputFile + ".")
          System.exit(FILE_NOT_FOUND)
          return
      }
      programWithoutVRegs.print(writer)
      writer.close()

    } else if (mode == Mode.CFGDOT) {
      ensureArgExists(args, curArgCnt)
      val outputFile = new File(args(curArgCnt))
      curArgCnt += 1

      val regAlloc = GraphColouringRegAlloc

      var program: AssemblyProgram = null
      try {
        val reader = new FileReader(inputFileFile)
        program = AssemblyParser.readAssemblyProgram(Source.fromFile(inputFileFile))
        reader.close()
      } catch {
        case e: FileNotFoundException =>
          System.out.println("File " + inputFile + " does not exist.")
          System.exit(FILE_NOT_FOUND)
          return
        case e: IOException =>
          System.out.println("An I/O exception occurred when reading " + inputFile + ".")
          System.exit(IO_EXCEPTION)
          return
      }

      val dotWriter = new PrintWriter(outputFile.getPath)
      dotWriter.println("digraph ast {")
      val dotPrinter = new CFGDotPrinter(dotWriter)
      dotPrinter.emitEntry() // emits the entry node at the beginning of the graph
      program.sections.foreach(s => {
        if (s.sectionType == SectionType.TEXT) {

          val cfg = GraphColouringRegAlloc.buildCFG(s.items)
          dotPrinter.visit(cfg)

        }
      })
      dotWriter.println("\n}")
      dotWriter.flush()
      dotWriter.close()

      // compile the dot file output
      val dotOutPutFileName = outputFile.getPath.replaceAll("(?<!^)[.].*", "")
      val dotCompileExitCode = s"dot -Tpdf $outputFile -o $dotOutPutFileName.pdf" !;
      println("Dot production exit code: " + dotCompileExitCode)

    } else System.exit(MODE_FAIL)
  }
}

