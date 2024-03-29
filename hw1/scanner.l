%{
    #include <stdio.h>
    #include <string.h>
    #include <stdbool.h>

    int numLines = 0;
    char currentLine[300];
    bool source = true;
    bool token = true;

    void print();
    void printLine();
    void appendLine();
%}

keyword         for|do|while|break|continue|if|else|return|struct|switch|case|default|void|int|double|float|char|const|signed|unsigned|short|long
macro           NULL|__COUNTER__|__LINE__|INT_MAX|INT_MIN|CHAR_MAX|CHAR_MIN|MAX|MIN
identifier      [[:alpha:]_][[:alnum:]_]*
operator        [+\-*/%<>=!&|]|"++"|"--"|"<="|">="|"=="|"!="|"&&"|"||"
punctuation     [:;,.\[\](){}]
integer         [+-]?[[:digit:]]+
float           [+-]?[[:digit:]]*\.[[:digit:]]*
string          \".*\"
character       '.'|'\\.*'
blank           [ \t\r]+

%x C_COMMENT

%%
{keyword}               print("key:");
{macro}                 print("macro:");
{identifier}            print("id:");
{operator}              print("op:");
{punctuation}           print("punc:");
{integer}               print("integer:");
{float}                 print("float:");
{string}                print("string:");
{character}             print("char:");

{blank}                 appendLine();
\n                      printLine();

"//"+[^\n]*+\n          { appendLine(); printLine(); }
"/*"                    { BEGIN(C_COMMENT); appendLine(); }
<C_COMMENT>"*/"         { appendLine(); BEGIN(INITIAL); }
<C_COMMENT>\n           printLine();
<C_COMMENT>.            appendLine();

"#pragma"{blank}"source"{blank}"on"{blank}*      { source = true; appendLine();}
"#pragma"{blank}"source"{blank}"off"{blank}*     { source = false; appendLine();}
"#pragma"{blank}"token"{blank}"on"{blank}*       { token = true; appendLine();}
"#pragma"{blank}"token"{blank}"off"{blank}*      { token = false; appendLine();}
%%

void print(char *str) {
    if (token)
        printf("#%s%s\n", str, yytext);
    appendLine();
}

void appendLine() {
    strcat(currentLine, yytext);
}

void printLine() {
    numLines++;
    if (source)
        printf("%d:%s\n", numLines, currentLine);
    strcpy(currentLine, "");
}

int main() {
    yylex();
    return 0;
}