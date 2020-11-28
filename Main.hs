module Main where
import Lexer
import Parser
import Ast

stringOfTerm :: Term -> String
stringOfTerm t = case t of
  S -> "S"
  K -> "K"
  I -> "I"
  TApp t1 t2 -> stringOfTerm t1 ++ " " ++ stringOfTerm t2

eval :: Term -> Term
eval t = case t of
  TApp I x -> x
  TApp (TApp K x) _ -> x
  TApp (TApp (TApp S x) y) z -> TApp (TApp x z) (TApp y z)
  TApp t1 t2 ->
    let t1' = eval t1
     in let t2' = eval t2
         in if t1' /= t1 || t2' /= t2
              then eval (TApp t1' t2')
              else TApp t1 t2
  t -> t

main :: IO ()
main = do
  s <- getContents
  let ast = parse (scanTokens s)
  print ast
  print (stringOfTerm (eval ast))
