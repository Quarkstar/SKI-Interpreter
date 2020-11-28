all: Main

.PHONY: clean

Lexer.hs : Lexer.x
	alex Lexer.x

Parser.hs : Ast.hs Parser.y
	happy Parser.y

Main : Lexer.hs Parser.hs Ast.hs Main.hs
	ghc --make Main.hs

clean :
	rm -rf *.o *.hi Parser.hs Lexer.hs Main
