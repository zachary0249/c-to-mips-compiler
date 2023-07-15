package regalloc

import gen.asm.{Instruction, Label, Register}
import regalloc.ControlFlowGraph.Node

import java.io.FileWriter
import scala.collection.mutable

class ControlFlowGraph {
  val nodes: mutable.Buffer[Node] = mutable.ArrayBuffer[Node]()

  def addNode(node: Node): Unit = {
    if (node != null) nodes += node
  }


  override def toString: String = {
    val sb = new StringBuilder()
    sb.append("ControlFlowGraph( ")
    nodes.foreach(v => {
      sb.append(v.instruction)
      sb.append('\n')
    })

    sb.append(" ) end CFG")
    sb.toString()
  }

  /**
   * Gets Successors.
   *
   * @param node node to find successors of
   * @return successors
   */
  def succ(node: Node): mutable.MutableList[Node] = {
    // get all nodes which the given node has an edge pointing to
    node.adj
  }

  def runLivenessAnalysis(): mutable.LinkedHashMap[Node, (mutable.Set[Register], mutable.Set[Register])] = {
    val liveIn = mutable.Map.empty[Node, mutable.Set[Register]]
    val liveOut = mutable.Map.empty[Node, mutable.Set[Register]]

    for (node <- nodes) {
      liveIn(node) = mutable.Set.empty[Register]
      liveOut(node) = mutable.Set.empty[Register]
    }

    var changed = true
    while (changed) {
      changed = false
      for (node <- nodes.reverse) {
        val oldLiveIn = mutable.Set() ++= liveIn(node) // create new set to avoid edits in place
        val oldLiveOut = mutable.Set() ++= liveOut(node) // create new set to avoid edits in place
        liveOut(node) = mutable.Set() ++ succ(node).flatMap(liveIn(_)) // create new set to avoid edits in place
        liveIn(node) = node.instruction.uses().filter(r => r.isVirtual) ++
          (if (node.instruction.define().nonEmpty) liveOut(node) - node.instruction.define().get else liveOut(node))

        // keep looping if old and new aren't equal
        if (liveIn(node) != oldLiveIn || liveOut(node) != oldLiveOut) {
          changed = true
        }
      }
    }

    val nodeToLiveSets = mutable.LinkedHashMap.empty[Node, (mutable.Set[Register], mutable.Set[Register])]
    for (node <- nodes) {
      nodeToLiveSets(node) = (liveIn(node), liveOut(node))
    }
    nodeToLiveSets

  }

  def livenessToDot(fileName: String,
                    liveSets: mutable.LinkedHashMap[Node, (mutable.Set[Register], mutable.Set[Register])]): Unit = {
    val dotFilename = s"$fileName.dot"
    val pngFilename = s"$fileName.png"

    val writer = new FileWriter(dotFilename)

    writer.write("digraph LivenessGraph {\n")

    // Write nodes
    liveSets.keys.foreach(node => {
      val liveIn = liveSets(node)._1
      val liveOut = liveSets(node)._2
      writer.write(s"${node.id} [label=" + "\"Node " + node.instruction + "\\nLive In: " + s"${
        liveIn.mkString(", ")
      }\\nLive Out: " + liveOut.mkString(", ") + "\"")

      writer.write("];\n")
    })

    // Write edges
    liveSets.keys.foreach(node => {
      node.adj.foreach(adjNode => {
        writer.write(s"${node.id} -> ${adjNode.id};\n")
      })
    })

    writer.write("}\n")
    writer.close()

    // Generate PNG image from the DOT file using GraphViz
    import sys.process._
    s"dot -Tpng $dotFilename -o $pngFilename".!
  }

}

/**
 *
 * @author Zachary Hayden
 *         Date: 3/24/23
 */
object ControlFlowGraph {
  private var nodeCount = 0

  private def getNodeId: Int = {
    val tmp = nodeCount
    nodeCount += 1
    tmp
  }

  def apply(): ControlFlowGraph = new ControlFlowGraph()

  final case class Node(instruction: Instruction) {
    val adj: mutable.MutableList[Node] = mutable.MutableList[Node]()
    val id: Int = getNodeId

    var label: Option[Label] = None // optional label if there's a label defined and this is next instruction
    var goToLabel: Option[Label] = None

    def addToAdj(node: Node): Unit = {
      if (!adj.contains(node)) adj += node
    }

    private def printAdj(): String = {
      val sb = mutable.ArrayBuffer[Int]()
      adj.foreach(v => sb += v.id)
      sb.toString()
    }


    override def equals(obj: Any): Boolean = obj match {
      case other: Node => {
        this.instruction == other.instruction &&
          this.adj.map(_.id) == other.adj.map(_.id) &&
          this.id == other.id &&
          //          this.liveIn == other.liveIn &&
          //          this.liveOut == other.liveOut &&
          this.label == other.label &&
          this.goToLabel == other.goToLabel
      }
      case _ => false
    }

    override def hashCode(): Int = {
      val prime = 31
      var result = 1
      result = prime * result + instruction.hashCode()
      result = prime * result + adj.foreach(_.id).hashCode()
      result = prime * result + id
      //      result = prime * result + liveIn.hashCode()
      //      result = prime * result + liveOut.hashCode()
      result = prime * result + label.hashCode()
      result = prime * result + goToLabel.hashCode()
      result
    }


    override def toString: String = s"Node(instruction = $instruction, id# = $id, adjIds = ${printAdj()}, label = $label, goToLabel = $goToLabel)"
  }

}
