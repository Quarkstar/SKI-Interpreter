-- Code that appears in generated lexer
{
module Lexer where
}

%wrapper "basic"

-- Macros

$lower=[a-z]
$upper=[A-Z]

-- Rules
rule :-
  $white+    ;
  S          { \s -> TS }
  K          { \s -> TK }
  I          { \s -> TI }
  --$lower   { \s ->  VAR s}
  --$upper   { \s -> TERM s}


-- Code that executes while lexing
{
data Token =
  VAR String
  | TERM String
  | TS
  | TK
  | TI
  deriving(Eq,Show)

scanTokens = alexScanTokens
}
