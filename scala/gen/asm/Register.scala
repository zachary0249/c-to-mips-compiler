package gen.asm

import scala.collection.mutable

/**
 *
 * @author Zachary Hayden
 *         Date: 3/2/23
 */
sealed trait Register {
  def isVirtual: Boolean
}

object Register {
  final case class Virtual(name: String) extends Register {
    override def isVirtual: Boolean = true

    override def toString: String = name
  }

  object Virtual {
    // This hash map interns flyweight instances to ensure that no two Virtual instances have the same name.
    private val instances = new mutable.HashMap[String, Virtual]()

    /**
     * Gets the unique virtual register for a given name.
     *
     * @param name The virtual register's name.
     * @return The unique {@link Virtual} instance with name {@code name}.
     */
    def get(name: String): Virtual = instances.getOrElseUpdate(name, Virtual(name))


    /**
     * Creates a fresh virtual register with a unique name.
     *
     * @return A unique {@link Virtual} instance.
     */
    def create(): Virtual = {
      var counter = Virtual.instances.size
      var draftName: String = null
      do {
        draftName = "v" + counter
        counter += 1
      } while (Virtual.instances.contains(draftName))
      Virtual.get(draftName)
    }
  }

  /**
   * An architectural register. That is, one of the registers described by the MIPS ISA.
   */
  final case class Arch(num: Int, name: String) extends Register {
    override def toString: String = "$" + name

    override def isVirtual: Boolean = false
  }

  object Arch {
    val zero = new Arch(0, "zero")
    val v0 = new Arch(2, "v0")
    val v1 = new Arch(3, "v1")
    val a0 = new Arch(4, "a0")
    val a1 = new Arch(5, "a1")
    val a2 = new Arch(6, "a2")
    val a3 = new Arch(7, "a3")
    val t0 = new Arch(8, "t0")
    val t1 = new Arch(9, "t1")
    val t2 = new Arch(10, "t2")
    val t3 = new Arch(11, "t3")
    val t4 = new Arch(12, "t4")
    val t5 = new Arch(13, "t5")
    val t6 = new Arch(14, "t6")
    val t7 = new Arch(15, "t7")
    val s0 = new Arch(16, "s0")
    val s1 = new Arch(17, "s1")
    val s2 = new Arch(18, "s2")
    val s3 = new Arch(19, "s3")
    val s4 = new Arch(20, "s4")
    val s5 = new Arch(21, "s5")
    val s6 = new Arch(22, "s6")
    val s7 = new Arch(23, "s7")
    val t8 = new Arch(24, "t8")
    val t9 = new Arch(25, "t9")
    val gp = new Arch(28, "gp")
    val sp = new Arch(29, "sp")
    val fp = new Arch(30, "fp")
    val ra = new Arch(31, "ra")

    val allRegisters = Vector(zero,
                              v0, v1,
                              a0, a1, a2, a3,
                              t0, t1, t2, t3, t4, t5, t6, t7, t8, t9,
                              s0, s1, s2, s3, s4, s5, s6, s7,
                              gp, sp, fp, ra
                              )
  }


}
