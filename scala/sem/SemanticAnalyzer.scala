package sem

import ast.Program

import scala.util.{Failure, Success, Try}

/**
 *
 * @author Zachary Hayden
 *         Date: 2/15/23
 */
class SemanticAnalyzer {

  def analyze(program: Program): Int = {
    shortCircuitAnalyze(program) match {
      case Failure(exception) => {
        println(s"Semantic Analysis failed. Reason: $exception")
        1 // has to be at least 1 so that we know an error was hit
      }
      case Success(value) => value
    }
  }

  /**
   * Runs all semantic analysis, interfaces with main
   *
   * @param program program to analyze
   * @return 0 or 1 errors
   */
  private def shortCircuitAnalyze(program: Program): Try[Int] = Try {
    var errors = 0

    // NAME ANALYSIS
    val na = new NameAnalyzer
    na.visit(program)
    println(s"NAME ANALYSIS COMPLETED WITH ${na.errors} ERRORS\n")
    errors += na.errors

    // TYPE ANALYSIS
    val tc = new TypeAnalyzer
    tc.visit(program)
    println(s"TYPE ANALYSIS COMPLETED WITH ${tc.errors} ERRORS\n")
    errors += tc.errors

    // LVALUE ANALYSIS
    val lva = new LValueAnalyzer
    lva.visit(program)
    println(s"LVALUE ANALYSIS COMPLETED WITH ${lva.errors} ERRORS\n")
    errors += lva.errors

    errors
  }
}
