package regalloc

import gen.asm.Register
import regalloc.ConflictGraph.Node

import java.io.FileWriter
import scala.collection.mutable

/**
 *
 * @author Zachary Hayden
 *         Date: 3/29/23
 */
class ConflictGraph {
  val nodes: mutable.Set[Node] = mutable.Set.empty

  def getOrCreateNode(vReg: Register): Node = {
    nodes.find(n => n.vReg == vReg).getOrElse {
      val newNode = Node(vReg)
      addNode(newNode)
      newNode
    }
  }

  def addNode(node: Node): Unit = {
    if (node != null) nodes += node
  }

  def removeNode(node: Node): Unit = {
    // remove node from all edges stored in adjacency lists
    nodes.foreach(n => {
      n.adj.remove(node)
    })
    // remove node from list of nodes
    nodes -= node
  }

  def colorGraph(): (mutable.Set[Register], mutable.Map[Register, Register]) = {
    val availableRegisters = Set(Register.Arch.t2, Register.Arch.t3, Register.Arch.t4, Register.Arch.t5,
                                 Register.Arch.t6,
                                 Register.Arch.t7,
                                 Register.Arch.t8, Register.Arch.t9, Register.Arch.s0, Register.Arch.s1,
                                 Register.Arch.s2, Register.Arch.s3, Register.Arch.s4, Register.Arch.s5,
                                 Register.Arch.s6, Register.Arch.s7)


    val spilledRegisters = mutable.Set[Register]()
    val virtualToArchMap = mutable.Map[Register, Register]()
    val allocStack = mutable.Stack[Node]()
    // start step one of register allocation
    step1()

    // Step 1: While there are nodes with less than k neighbors, add to stack, remove them and their edges from the graph
    def step1(): Unit = {
      while (nodes.exists(_.degree < availableRegisters.size)) {
        val nodeToRemove = nodes.find(_.degree < availableRegisters.size).get
        allocStack.push(nodeToRemove)
        removeNode(nodeToRemove)
      }
    }

    // Step 2: Pick a node to spill and remove it along with its edges until all nodes have less than k neighbors
    while (nodes.nonEmpty) {
      // use the node with the highest degree and least amount of uses/defs as a heuristic
      val nodeToSpill = chooseNodeToSpill()
      spilledRegisters += nodeToSpill.vReg
      removeNode(nodeToSpill)
      if (nodes.exists(n => n.degree < availableRegisters.size)) step1()
    }

    // Step 3: pop vertices off the stack and color them using register not used by neighbors
    while (allocStack.nonEmpty) {
      val node = allocStack.pop()
      val neighborRegs = node.adj.filter(_.archReg.nonEmpty).map(_.archReg.get).toSet
      val availableReg = (availableRegisters -- neighborRegs).headOption
      availableReg match {
        // tag the node with arch register and add the mapping to resulting vr to ar map
        case Some(reg) => node.archReg = Some(reg); virtualToArchMap += (node.vReg -> reg)
        case None => spilledRegisters += node.vReg; System.err.println("")
      }
    }

    (spilledRegisters, virtualToArchMap)

  }

  /**
   * Chooses which node to remove from the conflict graph while having to choose which register to spill.
   * The calculation is based on the register that has the highest connectivity, lowest uses, and lowest definitions i.e. the
   * register which would require the least memory accesses should be the first to go as a heuristic.
   *
   * @return the node containing the register to remove from the graph and spill
   */
  private def chooseNodeToSpill(): Node = {
    nodes.minBy(_.costBenefitRatio)
  }

  /**
   * Performs a pass on the nodes in this conflict graph and attaches to them data indicating how often the virtual
   * register is used / defined, how many other virtual regs interfere with the variable, and if the variable is used in
   * a loop.
   *
   * @param controlFlowGraph the control flow graph with which we're looking at the instructions of
   */
  def fillInUsageInfo(controlFlowGraph: ControlFlowGraph): Unit = {
    // loop over all instructions in control flow graph
    controlFlowGraph.nodes.foreach(node => {

      // collect the nodes which are used in each instruction and fill in the conflict node with that info
      node.instruction.uses().foreach(vreg => {
        nodes.find(_.vReg == vreg) match {
          // if a node with the same virtual register is used then increment use count
          case Some(x) => x.uses += 1
          case None =>
        }
      })

      // increment definition count
      if (node.instruction.define().nonEmpty) {
        val vreg = node.instruction.define().get
        nodes.find(_.vReg == vreg) match {
          // if there's a conflict node with same register as in cfg node instruction then increment its definition count
          case Some(x) => x.definitions += 1
          case None =>
        }
      }

    })
  }

  def toDot(fileName: String): Unit = {
    val dotFilename = s"$fileName.dot"
    val pngFilename = s"$fileName.png"

    val writer = new FileWriter(dotFilename)

    val writeSet = mutable.Set[String]()
    writer.write("digraph ConflictGraph {")
    nodes.foreach(node => {
      node.adj.foreach(adjNode => {
        if (!writeSet.contains(s"${adjNode.vReg} -> ${node.vReg} [arrowhead=none];")) {
          writeSet += s"${node.vReg} -> ${adjNode.vReg} [arrowhead=none];"
        }
        //writer.write(s"${node.vReg} -> ${adjNode.vReg};")
      })
    })
    writeSet.foreach(s => {
      writer.write(s)
    })
    writer.write("}\n")
    writer.close()

    // Generate PNG image from the DOT file using GraphViz
    import sys.process._
    s"dot -Tpng $dotFilename -o $pngFilename".!
  }


  override def toString = s"ConflictGraph(nodes = $nodes)"
}

object ConflictGraph {
  def apply(): ConflictGraph = new ConflictGraph()

  final case class Node(vReg: Register) {
    val adj: mutable.Set[Node] = mutable.LinkedHashSet.empty
    var archReg: Option[Register.Arch] = None // to be set in graph coloring; architectural register mapped to

    // filled in during pass before coloring, used to determine which node to spill
    var uses: Int = 0
    var definitions: Int = 0

    def addToAdj(node: Node): Unit = {
      assert(node != null)
      adj += node
    }

    def removeAdj(node: Node): Unit = {
      adj.remove(node)
      node.adj.remove(this)
    }

    def degree: Int = adj.size

    def costBenefitRatio: Double = (uses + definitions) / (if (degree == 0) 1.0 else degree.toDouble)


    def printAdj(): String = {
      val sb = mutable.ArrayBuffer[Register]()
      adj.foreach(a => sb += a.vReg)
      sb.toString()
    }

    override def toString: String = s"Node(vReg = $vReg, adj = $printAdj)"
  }
}