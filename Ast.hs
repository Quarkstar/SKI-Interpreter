module Ast where

data Term
  = S
  | K
  | I
  | Var String
  | App Term Term
  | Grp Term
  deriving (Show, Eq)
