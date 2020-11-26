{
module Parser where
import Ast
import Lexer
}

%name parse
%tokentype { Token }
%error {parseError}

%token
  S    { S }
  K    { K }
  I    { I }
  var  { VAR $$ }
  term { TERM $$ }

%left add sub
%left mul div

%%

Term :
  const         { EConst $1 }
  | Exp add Exp { EAdd $1 $3 }
  | Exp sub Exp { ESub $1 $3 }
  | Exp mul Exp { EMul $1 $3 }
  | Exp div Exp { EDiv $1 $3 }

{
parseError :: [Token] -> a
parseError _ = error "Parse Error"
}
