module Main where
import Lexer
import Parser
import Ast

eval :: Exp -> Int
eval (EConst c) = c
eval (EAdd e1 e2) = (eval e1) + (eval e2)
eval (ESub e1 e2) = (eval e1) - (eval e2)
eval (EMul e1 e2) = (eval e1) * (eval e2)
eval (EDiv e1 e2) = (eval e1) `div` (eval e2)

main :: IO ()
main = do
  s <- getContents
  let ast = parse (scanTokens s)
  print (ast)
  print (eval ast)
