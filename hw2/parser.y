%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    extern int yyerror(char*);
    extern int yylex(void);

    int yydebug = 1;

    char scalar_decl[20] = "<scalar_decl>";
    char scalar_decl_[20] = "</scalar_decl>";
    char array_decl[20] = "<array_decl>";
    char array_decl_[20] = "</array_decl>";
    char func_decl[20] = "<func_decl>";
    char func_decl_[20] = "</func_decl>";
    char func_def[20] = "<func_def>";
    char func_def_[20] = "</func_def>";
    char expr[20] = "<expr>";
    char expr_[20] = "</expr>";
    char stmt[20] = "<stmt>";
    char stmt_[20] = "</stmt>";

    char *s(char *a) {
        char *r = (char *)malloc((strlen(a) + 1) * sizeof(char));
        r[0] = '\0';
        strcpy(r, a);
        return r;
    }

    char *set2(char *a, char *b) {
        char *r = (char *)malloc((strlen(a) + strlen(b) + 1) * sizeof(char));
        r[0] = '\0';

        strcat(r, a);
        strcat(r, b);
        
        free(a);
        free(b);
        return r;
    }

    char *set3(char *a, char *b, char *c) {
        char *r = (char *)malloc((strlen(a) + strlen(b) + strlen(c) + 1) * sizeof(char));
        r[0] = '\0';

        strcat(r, a);
        strcat(r, b);
        strcat(r, c);

        free(a);
        free(b);
        free(c);
        return r;
    }

    char *set4(char *a, char *b, char *c, char *d) {
        char *r = (char *)malloc((strlen(a) + strlen(b) + strlen(c) + strlen(d) + 1) * sizeof(char));
        r[0] = '\0';
        
        strcat(r, a);
        strcat(r, b);
        strcat(r, c);
        strcat(r, d);

        free(a);
        free(b);
        free(c);
        free(d);
        return r;
    }

    char *set5(char *a, char *b, char *c, char *d, char *e) {
        char *r = (char *)malloc((strlen(a) + strlen(b) + strlen(c) + strlen(d) + strlen(e) + 1) * sizeof(char));
        r[0] = '\0';
        
        strcat(r, a);
        strcat(r, b);
        strcat(r, c);
        strcat(r, d);
        strcat(r, e);

        free(a);
        free(b);
        free(c);
        free(d);
        free(e);
        return r;
    }

    char *set6(char *a, char *b, char *c, char *d, char *e, char *f) {
        char *r = (char *)malloc((strlen(a) + strlen(b) + strlen(c) + strlen(d) + strlen(e) + strlen(f) + 1) * sizeof(char));
        r[0] = '\0';
        
        strcat(r, a);
        strcat(r, b);
        strcat(r, c);
        strcat(r, d);
        strcat(r, e);
        strcat(r, f);

        free(a);
        free(b);
        free(c);
        free(d);
        free(e);
        free(f);
        return r;
    }

    char *set7(char *a, char *b, char *c, char *d, char *e, char *f, char *g) {
        char *r = (char *)malloc((strlen(a) + strlen(b) + strlen(c) + strlen(d) + strlen(e) + strlen(f) + strlen(g) + 1) * sizeof(char));
        r[0] = '\0';
        
        strcat(r, a);
        strcat(r, b);
        strcat(r, c);
        strcat(r, d);
        strcat(r, e);
        strcat(r, f);
        strcat(r, g);

        free(a);
        free(b);
        free(c);
        free(d);
        free(e);
        free(f);
        free(g);
        return r;
    }

    char *set8(char *a, char *b, char *c, char *d, char *e, char *f, char *g, char *h) {
        char *r = (char *)malloc((strlen(a) + strlen(b) + strlen(c) + strlen(d) + strlen(e) + strlen(f) + strlen(g) + strlen(h) + 1) * sizeof(char));
        r[0] = '\0';
        
        strcat(r, a);
        strcat(r, b);
        strcat(r, c);
        strcat(r, d);
        strcat(r, e);
        strcat(r, f);
        strcat(r, g);
        strcat(r, h);

        free(a);
        free(b);
        free(c);
        free(d);
        free(e);
        free(f);
        free(g);
        free(h);
        return r;
    }

    char *set9(char *a, char *b, char *c, char *d, char *e, char *f, char *g, char *h, char *i) {
        char *r = (char *)malloc((strlen(a) + strlen(b) + strlen(c) + strlen(d) + strlen(e) + strlen(f) + strlen(g) + strlen(h) + strlen(i) + 1) * sizeof(char));
        r[0] = '\0';
        
        strcat(r, a);
        strcat(r, b);
        strcat(r, c);
        strcat(r, d);
        strcat(r, e);
        strcat(r, f);
        strcat(r, g);
        strcat(r, h);
        strcat(r, i);

        free(a);
        free(b);
        free(c);
        free(d);
        free(e);
        free(f);
        free(g);
        free(h);
        free(i);
        return r;
    }

%}

%union {
    char* stringVal;
}

%token<stringVal> IDENT INTEGER FLOAT CHAR STRING IF ELSE FOR DO WHILE BREAK CONTINUE RETURN SWITCH CASE DEFAULT
%token<stringVal> CONST SIGNED UNSIGNED LONG SHORT INT CHAR_ FLOAT_ DOUBLE VOID
%token<stringVal> ':' ';' '.' '{' '}'

%type<stringVal> program scalar_decl idents ident array_decl arrays func_decl func_def expr stmt ifelse_stmt switch_stmt
%type<stringVal> while_stmt for_stmt rebrco_stmt comp_stmt comps var_decl params literal variable
%type<stringVal> stmts array arr_content switch_clauses switch_clause start type const sign long

%left <stringVal> ','
%right <stringVal> '='
%left <stringVal> DOUBLEOR
%left <stringVal> DOUBLEAND
%left <stringVal> '|'
%left <stringVal> '^'
%left <stringVal> '&'
%left <stringVal> EQUAL NOTEQUAL
%left <stringVal> '>' EQUALGREATER '<' EQUALLESS
%left <stringVal> LEFTSHIFT RIGHTSHIFT
%left <stringVal> '+' '-'
%left <stringVal> '*' '/' '%'
%right <stringVal> DOUBLEPLUS DOUBLEMINUS '!' '~' lv2_prec
%left <stringVal> '[' ']' '(' ')' lv1_prec
%left <stringVal> basic_element

%start start
 
%%
// start
start
        : program { printf("%s", s($1)); free($1); }
        ;

// program
program
        : program var_decl { $$ = set2(s($1), s($2)); free($1); free($2); }
        | program func_decl { $$ = set2(s($1), s($2)); free($1); free($2); }
        | program func_def { $$ = set2(s($1), s($2)); free($1); free($2); }
        | program stmt { $$ = set2(s($1), s($2)); free($1); free($2); }
        | var_decl { $$ = s($1); free($1); }
        | func_decl { $$ = s($1); free($1); }
        | func_def { $$ = s($1); free($1); }
        | stmt { $$ = s($1); free($1); }
        ;

// variable declaration
var_decl
        : scalar_decl { $$ = s($1); free($1); }
        | array_decl { $$ = s($1); free($1); }
        ;

// scalar declaration
scalar_decl
        : type idents ';' { $$ = set5(s(scalar_decl), s($1), s($2), s($3), s(scalar_decl_)); free($1); free($2); free($3); }
        ;

idents
        : ident { $$ = s($1); free($1); }
        | idents ',' ident { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        ;

ident
        : IDENT { $$ = s($1); free($1); }
        | ident '=' expr { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | '*' IDENT { $$ = set2(s($1), s($2)); free($1); free($2); }
        ;

// type
type
        : const sign long INT { $$ = set4(s($1), s($2), s($3), s($4)); free($1); free($2); free($3); free($4); }
        | const sign LONG LONG { $$ = set4(s($1), s($2), s($3), s($4)); free($1); free($2); free($3); free($4); }
        | const sign LONG { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | const sign SHORT { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | const sign CHAR_ { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | const SIGNED { $$ = set2(s($1), s($2)); free($1); free($2); }
        | const UNSIGNED { $$ = set2(s($1), s($2)); free($1); free($2); }
        | const FLOAT_ { $$ = set2(s($1), s($2)); free($1); free($2); }
        | const DOUBLE { $$ = set2(s($1), s($2)); free($1); free($2); }
        | const VOID { $$ = set2(s($1), s($2)); free($1); free($2); }
        | CONST { $$ = s($1); free($1); }
        ;

const
        : CONST { $$ = s($1); free($1); }
        | { $$ = s(""); }
        ;
sign
        : SIGNED { $$ = s($1); free($1); }
        | UNSIGNED { $$ = s($1); free($1); }
        | { $$ = s(""); }
        ;

long
        : LONG LONG { $$ = set2(s($1), s($2)); free($1); free($2); }
        | LONG { $$ = s($1); free($1); }
        | SHORT { $$ = s($1); free($1); }
        | { $$ = s(""); }
        ;

// array declaration
array_decl
        : type arrays ';' { $$ = set5(s(array_decl), s($1), s($2), s($3), s(array_decl_)); free($1); free($2); free($3); }
        | type arrays '=' arr_content ';' { $$ = set7(s(array_decl), s($1), s($2), s($3), s($4), s($5), s(array_decl_)); free($1); free($2); free($3); }
        ;

arrays
        : IDENT array { $$ = set2(s($1), s($2)); free($1); free($2); }
        | arrays ',' IDENT array { $$ = set4(s($1), s($2), s($3), s($4)); free($1); free($2); free($3); free($4); }
        | arrays ',' IDENT { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        ;

array
        : array '[' expr ']' { $$ = set4(s($1), s($2), s($3), s($4)); free($1); free($2); free($3); free($4); }
        | '[' expr ']' { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        ;

arr_content
        : '{'  '}' { $$ = set2(s($1), s($2)); free($1); free($2); }
        | arr_content ',' arr_content { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | '{' arr_content '}' { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | expr { $$ = s($1); free($1); }
        ;

// function declaration
func_decl
        : type IDENT '(' params ')' ';' { $$ = set8(s(func_decl), s($1), s($2), s($3), s($4), s($5), s($6), s(func_decl_)); free($1); free($2); free($3); free($4); free($5); free($6); }
        | type '*' IDENT '(' params ')' ';' { $$ = set9(s(func_decl), s($1), s($2), s($3), s($4), s($5), s($6), s($7), s(func_decl_)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); }
        ;

params
        : expr { $$ = s($1); free($1); }
        | type IDENT { $$ = set2(s($1), s($2)); free($1); free($2); }
        | type '*' IDENT { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | params ',' params { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | { $$ = s(""); }
        ;

// function definiton
func_def
        : type IDENT '(' params ')' comp_stmt { $$ = set8(s(func_def), s($1), s($2), s($3), s($4), s($5), s($6), s(func_def_)); free($1); free($2); free($3); free($4); free($5); free($6); }
        | type '*' IDENT '(' params ')' comp_stmt  { $$ = set9(s(func_def), s($1), s($2), s($3), s($4), s($5), s($6), s($7), s(func_def_)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); }
        ;

// expression
expr:
        // basic element
        '(' expr ')' %prec basic_element { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | literal %prec basic_element { $$ = set3(s(expr), s($1), s(expr_)); free($1); }
        | variable %prec basic_element { $$ = set3(s(expr), s($1), s(expr_)); free($1); }

        // op_between
        | expr '+' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '-' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '*' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '/' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '%' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '<' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '>' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '=' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '&' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '^' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr '|' expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr EQUALLESS expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr EQUALGREATER expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr EQUAL expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr NOTEQUAL expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr DOUBLEAND expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr DOUBLEOR expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr LEFTSHIFT expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }
        | expr RIGHTSHIFT expr { $$ = set5(s(expr), s($1), s($2), s($3), s(expr_)); free($1); free($2); free($3); }

        // op_post
        | expr DOUBLEPLUS %prec lv1_prec { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }
        | expr DOUBLEMINUS %prec lv1_prec { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }

        // op_pre
        | DOUBLEPLUS expr { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }
        | DOUBLEMINUS expr { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }
        | '*' expr %prec lv2_prec { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }
        | '&' expr %prec lv2_prec { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }
        | '+' expr %prec lv2_prec { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }
        | '-' expr %prec lv2_prec { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }
        | '!' expr %prec lv2_prec { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }
        | '~' expr %prec lv2_prec { $$ = set4(s(expr), s($1), s($2), s(expr_)); free($1); free($2); }
        | '(' type ')' expr %prec lv2_prec { $$ = set6(s(expr), s($1), s($2), s($3), s($4), s(expr_)); free($1); free($2); free($3); free($4); }
        | '(' type '*' ')' expr %prec lv2_prec { $$ = set7(s(expr), s($1), s($2), s($3), s($4), s($5), s(expr_)); free($1); free($2); free($3); free($4); free($5); }

        // array subscription
        | array { $$ = set3(s(expr), s($1), s(expr_)); free($1); }

        // function invocation
        | expr '(' params ')' { $$ = set6(s(expr), s($1), s($2), s($3), s($4), s(expr_)); free($1); free($2); free($3); free($4); }
        ;

variable
        : IDENT { $$ = s($1); free($1); }
        | IDENT array { $$ = set2(s($1), s($2)); free($1), free($2); }
        ;

literal
        : INTEGER { $$ = s($1); free($1); }
        | FLOAT { $$ = s($1); free($1); }
        | CHAR { $$ = s($1); free($1); }
        | STRING { $$ = s($1); free($1); }
        ;

// statement
stmt
        : expr ';' { $$ = set4(s(stmt), s($1), s($2), s(stmt_)); free($1); free($2); }
        | ifelse_stmt { $$ = set3(s(stmt), s($1), s(stmt_)); free($1); }
        | switch_stmt { $$ = set3(s(stmt), s($1), s(stmt_)); free($1); }
        | while_stmt { $$ = set3(s(stmt), s($1), s(stmt_)); free($1); }
        | for_stmt { $$ = set3(s(stmt), s($1), s(stmt_)); free($1); }
        | rebrco_stmt { $$ = set3(s(stmt), s($1), s(stmt_)); free($1); }
        | comp_stmt { $$ = set3(s(stmt), s($1), s(stmt_)); free($1); }
        ;

ifelse_stmt
        : IF '(' expr ')' comp_stmt { $$ = set5(s($1), s($2), s($3), s($4), s($5)); free($1); free($2); free($3); free($4); free($5); }
        | IF '(' expr ')' comp_stmt ELSE comp_stmt { $$ = set7(s($1), s($2), s($3), s($4), s($5), s($6), s($7)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); }
        ;

switch_stmt
        : SWITCH '(' expr ')' '{' switch_clauses '}' { $$ = set7(s($1), s($2), s($3), s($4), s($5), s($6), s($7)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); }
        | SWITCH '(' expr ')' '{' '}' { $$ = set6(s($1), s($2), s($3), s($4), s($5), s($6)); free($1); free($2); free($3); free($4); free($5); free($6); }
        ;

switch_clauses
        : switch_clauses switch_clause { $$ = set2(s($1), s($2)); free($1); free($2); }
        | switch_clause { $$ = s($1); free($1); }
        ;

switch_clause
        : CASE expr ':' stmts { $$ = set4(s($1), s($2), s($3), s($4)); free($1); free($2); free($3); free($4); }
        | CASE expr ':' { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | DEFAULT ':' stmts { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | DEFAULT ':' { $$ = set2(s($1), s($2)); free($1); free($2); }
        ;

stmts
        : stmts stmt { $$ = set2(s($1), s($2)); free($1), free($2); }
        | stmt { $$ = s($1); free($1); }
        ;

while_stmt
        : WHILE '(' expr ')' stmt { $$ = set5(s($1), s($2), s($3), s($4), s($5)); free($1); free($2); free($3); free($4); free($5); }
        | DO stmt WHILE '(' expr ')' ';' { $$ = set7(s($1), s($2), s($3), s($4), s($5), s($6), s($7)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); }
        ;

for_stmt
        : FOR '(' expr ';' expr ';' expr ')' stmt { $$ = set9(s($1), s($2), s($3), s($4), s($5), s($6), s($7), s($8), s($9)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); free($8); free($9); }
        | FOR '(' ';' expr ';' expr ')' stmt { $$ = set8(s($1), s($2), s($3), s($4), s($5), s($6), s($7), s($8)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); free($8); }
        | FOR '(' expr ';' ';' expr ')' stmt { $$ = set8(s($1), s($2), s($3), s($4), s($5), s($6), s($7), s($8)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); free($8); }
        | FOR '(' expr ';' expr ';' ')' stmt { $$ = set8(s($1), s($2), s($3), s($4), s($5), s($6), s($7), s($8)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); free($8); }
        | FOR '(' expr ';' ';' ')' stmt { $$ = set7(s($1), s($2), s($3), s($4), s($5), s($6), s($7)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); }
        | FOR '(' ';' expr ';' ')' stmt { $$ = set7(s($1), s($2), s($3), s($4), s($5), s($6), s($7)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); }
        | FOR '(' ';' ';' expr ')' stmt { $$ = set7(s($1), s($2), s($3), s($4), s($5), s($6), s($7)); free($1); free($2); free($3); free($4); free($5); free($6); free($7); }
        | FOR '(' ';' ';' ')' stmt { $$ = set6(s($1), s($2), s($3), s($4), s($5), s($6)); free($1); free($2); free($3); free($4); free($5); free($6); }
        ;

rebrco_stmt
        : RETURN expr ';' { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        | RETURN ';' { $$ = set2(s($1), s($2)); free($1), free($2); }
        | BREAK ';' { $$ = set2(s($1), s($2)); free($1), free($2); }
        | CONTINUE ';' { $$ = set2(s($1), s($2)); free($1), free($2); }
        ;

comp_stmt
        : '{' '}' { $$ = set2(s($1), s($2)); free($1); free($2); }
        | '{' comps '}' { $$ = set3(s($1), s($2), s($3)); free($1); free($2); free($3); }
        ;
comps  
        : comps stmt { $$ = set2(s($1), s($2)); free($1), free($2); }
        | comps var_decl { $$ = set2(s($1), s($2)); free($1), free($2); }
        | stmt { $$ = s($1); free($1); }
        | var_decl { $$ = s($1); free($1); }
        ;

%%

int main(void) {
    yyparse();
    return 0;
}

int yyerror(char* s) {
    fprintf(stderr, "%s\n", s);
    return 0;
}