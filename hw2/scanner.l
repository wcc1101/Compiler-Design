%{
    #include "y.tab.h"

    void setVal(char *y) {
        yylval.stringVal = (char *)malloc((strlen(y) + 1) * sizeof(char));
        strcpy(yylval.stringVal, y);
    }
    void setVal_float(char *y) {
        yylval.stringVal = (char *)malloc((strlen(y) + 6) * sizeof(char));
        sprintf(yylval.stringVal, "%f", atof(y));
    }
%}

identifier      [[:alpha:]_][[:alnum:]_]*
operator        [+\-*/%<>=!&|~^]
punctuation     [:;,.\[\](){}]
integer         [[:digit:]]+
float           [[:digit:]]*\.[[:digit:]]*
string          \"(\\a|\\b|\\e|\\f|\\n|\\r|\\t|\\v|\\\\|\\\'|\\\"|\\\?|(\\[0-9]{1,3})|(\\x[0-9A-Fa-f]+)|(\\u[0-9A-Fa-f]{4})|(\\U[0-9A-Fa-f]{8})|[^"\\\n])*\"
character       '(\\a|\\b|\\e|\\f|\\n|\\r|\\t|\\v|\\\\|\\\'|\\\"|\\\?|(\\[0-9]{1,3})|(\\x[0-9A-Fa-f]+)|(\\u[0-9A-Fa-f]{4})|(\\U[0-9A-Fa-f]{8})|[^'\\\n])'
blanks          [ \t\r]+

%x C_COMMENT
%x C_COMMENT_SINGLE

%%

"//"                    { BEGIN(C_COMMENT_SINGLE); }
<C_COMMENT_SINGLE>.     ;
<C_COMMENT_SINGLE>\n    { BEGIN(INITIAL); }
"/*"                    { BEGIN(C_COMMENT); }
<C_COMMENT>"*/"         { BEGIN(INITIAL); }
<C_COMMENT>\n           ;
<C_COMMENT>.            ;

"#pragma"{blanks}"source"{blanks}"on"{blanks}*      ;
"#pragma"{blanks}"source"{blanks}"off"{blanks}*     ;
"#pragma"{blanks}"token"{blanks}"on"{blanks}*       ;
"#pragma"{blanks}"token"{blanks}"off"{blanks}*      ;

{operator}              { setVal(yytext); return yytext[0]; }
{punctuation}           { setVal(yytext); return yytext[0]; }
{integer}               { setVal(yytext); return INTEGER; }
{float}                 { setVal_float(yytext); return FLOAT; }
{string}                { setVal(yytext); return STRING; }
{character}             { setVal(yytext); return CHAR; }

"++"                    { setVal(yytext); return DOUBLEPLUS; }
"--"                    { setVal(yytext); return DOUBLEMINUS; }
"<="                    { setVal(yytext); return EQUALLESS; }
">="                    { setVal(yytext); return EQUALGREATER; }
"=="                    { setVal(yytext); return EQUAL; }
"!="                    { setVal(yytext); return NOTEQUAL; }
"&&"                    { setVal(yytext); return DOUBLEAND; }
"||"                    { setVal(yytext); return DOUBLEOR; }
">>"                    { setVal(yytext); return RIGHTSHIFT; }
"<<"                    { setVal(yytext); return LEFTSHIFT; }

if                      { setVal(yytext); return IF; }
else                    { setVal(yytext); return ELSE; }
for                     { setVal(yytext); return FOR; }
do                      { setVal(yytext); return DO; }
while                   { setVal(yytext); return WHILE; }
break                   { setVal(yytext); return BREAK; }
continue                { setVal(yytext); return CONTINUE; }
return                  { setVal(yytext); return RETURN; }
switch                  { setVal(yytext); return SWITCH; }
case                    { setVal(yytext); return CASE; }
default                 { setVal(yytext); return DEFAULT; }
NULL                    { setVal("0"); return INTEGER; }

const                   { setVal(yytext); return CONST; }
signed                  { setVal(yytext); return SIGNED; }
unsigned                { setVal(yytext); return UNSIGNED; }
long                    { setVal(yytext); return LONG; }
short                   { setVal(yytext); return SHORT; }
int                     { setVal(yytext); return INT; }
char                    { setVal(yytext); return CHAR_; }
float                   { setVal(yytext); return FLOAT_; }
double                  { setVal(yytext); return DOUBLE; }
void                    { setVal(yytext); return VOID; }

{identifier}            { setVal(yytext); return IDENT; }

{blanks}                ;
\n                      ;


%%

