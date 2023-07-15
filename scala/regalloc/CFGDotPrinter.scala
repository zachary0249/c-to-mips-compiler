package regalloc

import java.io.PrintWriter
import scala.collection.mutable

/**
 *
 * @author Zachary Hayden
 *         Date: 3/26/23
 */
class CFGDotPrinter(writer: PrintWriter) {
  private var _nodeCnt = 0

  private def nodeCnt: Int = {
    val tmp = _nodeCnt
    _nodeCnt += 1
    tmp
  }

  private def nodeId(): String = {
    "Node" + nodeCnt
  }

  private def createLabel(name: String): String = {
    "[label=\"" + name + "\"];"
  }

  private def createEdge(parent: String, child: String): Unit = {
    writer.println(parent + "->" + child + ";")
  }

  private val nodeMap = mutable.Map[String, Node]()

  private def createNode(labelName: String): Node = {
    //    // nodes should be flyweights
    //    var existed = false
    //    if (nodeMap.contains(labelName.substring(labelName.lastIndexOf(":") + 1))) existed = true
    //    val ret = nodeMap
    //      .getOrElseUpdate(labelName.substring(labelName.lastIndexOf(":") + 1), Node(nodeId(), createLabel(labelName)))

    val ret = Node(nodeId(), createLabel(labelName))
    writer.println(ret.nodeID + ret.label)
    ret
  }

  private def createNodeFlyweight(labelName: String): Node = {
    // nodes should be flyweights
    val ret = nodeMap
      .getOrElseUpdate(labelName.substring(labelName.lastIndexOf(":") + 1), Node(nodeId(), createLabel(labelName)))
    writer.println(ret.nodeID + ret.label)
    ret
  }

  def emitEntry(): Unit = {
    createNode("entry")
  }

  def visit(controlFlowGraph: ControlFlowGraph): Unit = {
    controlFlowGraph.nodes.foreach(node => {
      writer.println(node.id + "[label=\"" + node.instruction.toString + "\"];")
      node.adj.foreach(successor => {
        writer.println(s"  ${node.id} -> ${successor.id};")
      })
    })
  }

  private final case class Node(nodeID: String, label: String)

}
