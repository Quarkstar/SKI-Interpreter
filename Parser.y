{
module Parser where
import Ast
import Lexer
}

%name parse
%tokentype { Token }
%error { parseError }

%token
  s    { TS }
  k    { TK }
  i    { TI }
  var  { VAR $$ }

%nonassoc s k i var
%nonassoc APP

%%

Term:
  s                     { S }
  | k                   { K }
  | i                   { I }
  | var                 { Var $1 }
  | Term Term %prec APP { App $1 $2 }

{
parseError :: [Token] -> a
parseError _ = error "Parse Error"
}
