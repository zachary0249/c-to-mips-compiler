package gen.asm

/**
 *
 * @author Zachary Hayden
 *         Date: 3/6/23
 */
trait AssemblyPass {
  /**
   * Applies this pass to an {@link AssemblyProgram}. Returns a transformed version of that program. This method may
   * modify {@code program}.
   *
   * @param program An {@link AssemblyProgram} to transform.
   * @return A transformed version of {@code program}.
   */
  def apply(program: AssemblyProgram): AssemblyProgram

}

object AssemblyPass {
  val NOP: AssemblyPass = new AssemblyPass {
    override def apply(program: AssemblyProgram): AssemblyProgram = program
  }
}