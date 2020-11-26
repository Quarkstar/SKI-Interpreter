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
  $white+   ;
  S         { \s -> S }
  K         { \s -> K }
  I         { \s -> I }
  --$lower   { \s ->  VAR s}
  --$upper   { \s -> TERM s}


-- Code that executes while lexing
{
data Token =
  VAR String
  | TERM String
  | S
  | K
  | I
  deriving(Eq,Show)

scanTokens = alexScanTokens
}
