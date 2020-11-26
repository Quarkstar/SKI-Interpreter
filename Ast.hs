module Ast where

  data Cmb = S | K | I

  data Term =
    Tvar String
    | ECmb Cmb Term
    | EAbs [Tvar] Term
    | EApp Term Term
    deriving (Eq,Show)
