{
module Parser where
import Ast
import Lexer
}

%name parse
%tokentype { Token }
%error {parseError}

%token
  s    {TS}
  k    {TK}
  i    {TI}
  var  { VAR $$ }
  term { TERM $$ }

%nonassoc s k i
%nonassoc APP
%%

Term:
  s          { S }
  | k        { K }
  | i        { I }
  | Term Term %prec APP {TApp $1 $2}

{
parseError :: [Token] -> a
parseError _ = error "Parse Error"
}
