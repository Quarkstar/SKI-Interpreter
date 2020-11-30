module Ast where

data Term
  = S
  | K
  | I
  | Var String
  | App Term Term
  deriving (Show, Eq)
