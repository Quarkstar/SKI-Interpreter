module Ast where

data Term
  = S
  | K
  | I
  | TApp Term Term
  deriving (Show, Eq)
