all: scanner

scanner: scanner.l
	flex scanner.l
	gcc -o scanner lex.yy.c -lfl
