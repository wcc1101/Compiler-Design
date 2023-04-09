all: scanner

scanner: scanner.l
	flex scanner.l
	gcc -o scanner lex.yy.c -lfl

test: 
	./scanner < testcase_basic > mine
	golden_scanner < testcase_basic > answer
	diff mine answer

clean:
	rm scanner lex.yy.c mine answer