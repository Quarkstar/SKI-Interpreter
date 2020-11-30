{
module Lexer where
}

%wrapper "basic"

$lower=[a-z]

rule :-
  $white+    ;
  S          { \s -> TS }
  K          { \s -> TK }
  I          { \s -> TI }
  [\(]       { \s -> LP }
  [\)]       { \s -> RP }
  $lower     { \s ->  VAR s }

{
data Token =
  VAR String
  | TS
  | TK
  | TI
  | LP
  | RP
  deriving(Eq,Show)

scanTokens = alexScanTokens
}
