all:
	clear
	lex nzeromum.l
	bison -d nzeromum.y 
	gcc -o nzeromum lex.yy.c nzeromum.tab.c -ll
	./nzeromum