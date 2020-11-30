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
  $lower   { \s ->  VAR s}

{
data Token =
  VAR String
  | TS
  | TK
  | TI
  deriving(Eq,Show)

scanTokens = alexScanTokens
}
