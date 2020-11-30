module Main where
import Lexer
import Parser
import Ast

stringOfTerm :: Term -> String
stringOfTerm t = case t of
  S -> "S"
  K -> "K"
  I -> "I"
  Var x -> x
  App t1 t2 -> "(" ++ stringOfTerm t1 ++ " " ++ stringOfTerm t2 ++ ")"

eval :: Term -> Term
eval t = case t of
  App I x -> x
  App (App K x) _ -> x
  App (App (App S x) y) z -> App (App x z) (App y z)
  App t1 t2 ->
    let t1' = eval t1
     in let t2' = eval t2
         in if t1' /= t1 || t2' /= t2
              then eval (App t1' t2')
              else App t1 t2
  t -> t

main :: IO ()
main = do
  s <- getContents
  let ast = parse (scanTokens s)
  print (stringOfTerm (eval ast))
