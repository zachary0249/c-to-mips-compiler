package lexer

class Scanner(private val source: io.Source) {
  private var peeked: Option[Char] = None
  private var line: Int = 1
  private var column: Int = 1

  def getColumn: Int = column

  def getLine: Int = line

  def peek(): Option[Char] = {
    if (peeked.nonEmpty) peeked else if (!source.hasNext) None else {
      val ret = source.next()
      peeked = Some(ret)
      peeked
    }

  }

  def next(): Option[Char] = {
    val nxt = if (peeked.nonEmpty) {
      val tmp = peeked
      peeked = None
      tmp
    } else if (!source.hasNext) None
    else Some(source.next())

    nxt match {
      case Some(x) if x.equals('\n') => line += 1; column = 1
      case None => // do nothing it's EOF
      case _ => column += 1
    }

    nxt
  }

  def hasNext: Boolean = source.hasNext

  def close(): Unit = source.close()
}