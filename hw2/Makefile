all: scanner

scanner: scanner.l parser.y
	flex scanner.l
	byacc -d -v parser.y
	gcc -o parser lex.yy.c y.tab.c -lfl

debug: scanner.l parser.y
	flex scanner.l
	byacc -d -t parser.y
	gcc -o parser lex.yy.c y.tab.c -lfl

test:
	./parser < testcase.c > mine
	golden_parser < testcase.c > answer
	diff mine answer

clean:
	rm y.tab.c y.tab.h parser lex.yy.c y.output mine answer