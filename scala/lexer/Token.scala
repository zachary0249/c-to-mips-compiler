package lexer


object TokenClass extends Enumeration {
  type TokenClass = Value
  val IDENTIFIER, // ('a'|...|'z'|'A'|...|'Z'|'_')('0'|...|'9'|'a'|...|'z'|'A'|...|'Z'|'_')*

  ASSIGN, // '='

  // delimiters
  LBRA, // '{' // left brace
  RBRA, // '}' // right brace
  LPAR, // '(' // left parenthesis
  RPAR, // ')' // right parenthesis
  LSBR, // '[' // left square brace
  RSBR, // ']' // left square brace
  SC, // ';' // semicolon
  COMMA, // ','

  // types
  INT, // "int"
  VOID, // "void"
  CHAR, // "char"

  // keywords
  IF, // "if"
  ELSE, // "else"
  WHILE, // "while"
  RETURN, // "return"
  STRUCT, // "struct"
  SIZEOF, // "sizeof"

  // include
  INCLUDE, // "#include"

  // literals
  STRING_LITERAL, // \".*\"  any sequence of characters enclosed within two double quote " (please be aware of the escape character backslash \)
  INT_LITERAL, // ('0'|...|'9')+
  CHAR_LITERAL, // \'('a'|...|'z'|'A'|...|'Z'|'\t'|'\b'|'\n'|'\r'|'\f'|'\''|'\"'|'\\'|'\0'|'.'|','|'_'|...)\'  a character starts and end with a single quote '

  // logical operators
  LOGAND, // "&&"
  LOGOR, // "||"

  // comparisons
  EQ, // "=="
  NE, // "!="
  LT, // '<'
  GT, // '>'
  LE, // "<="
  GE, // ">="

  // operators
  PLUS, // '+'
  MINUS, // '-'
  ASTERIX, // '*'  // can be used for multiplication or pointers
  DIV, // '/'
  REM, // '%'
  AND, // '&'

  // struct member access
  DOT, // '.'

  // object oriented tokens
  CLASS, NEW, EXTENDS,

  // special tokens
  EOF, // signal end of file
  INVALID // in case we cannot recognise a character as part of a valid token
  = Value
}

import lexer.TokenClass._
import util.Position

case class Token(tokenClass: TokenClass, position: Position, data: String = "") {
  assert(tokenClass != null)

  override def toString: String = if (data.equals("")) tokenClass.toString else tokenClass.toString + s"($data)"
}