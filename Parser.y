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
  lp   { LP }
  rp   { RP }
  var  { VAR $$ }

%nonassoc s k i var lp rp
%nonassoc APP

%%

Term:
  s                      { S }
  | k                    { K }
  | i                    { I }
  | var                  { Var $1 }
  | lp Term rp           { Grp $2 }
  | Term Term %prec APP  { App $1 $2 }

{
parseError :: [Token] -> a
parseError _ = error "Parse Error"
}
