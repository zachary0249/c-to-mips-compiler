package sem

import scala.collection.mutable

/**
 *
 * @author Zachary Hayden
 *         Date: 2/15/23
 */
final class Scope {
  var outer: Scope = _

  private val symbolTable: mutable.Map[String, Symbol] = mutable.HashMap.empty

  def lookup(name: String): Option[Symbol] = {
    // first look in current scope otherwise check outer scope
    lookupCurrent(name) match {
      case Some(x) => Some(x)
      case None => {
        // check the outer scope if not null else None
        if (outer != null) outer.lookup(name)
        else None
      }
    }
  }

  def lookupCurrent(name: String): Option[Symbol] = {
    symbolTable.get(name)
  }

  def put(symbol: Symbol): Unit = {
    assert(symbol != null && !symbolTable.contains(symbol.name))
    symbolTable.put(symbol.name, symbol)
  }

  override def toString: String = {
    s"Scope($symbolTable) -> ${
      if (outer != null) {
        outer.toString
      } else "null"
    }"
  }

  def isGlobal(): Boolean = {
    outer == null
  }
}

object Scope {

  def apply(): Scope = {
    new Scope
  }

  def apply(scope: Scope): Scope = {
    val s = new Scope
    s.outer = scope
    s
  }
}
