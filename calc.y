%{
#include <stdio.h>
int yylex();
void yyerror() { printf("Invalid Expression\n"); }
%}

%token ID NUMBER
%left '+' '-'
%left '*' '/'

%%

S : E '\n' { printf("Valid Expression\n"); };

E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | '(' E ')'
  | ID
  | NUMBER
  ;

%%

int main() {
    yyparse();
    return 0;
}   

create a new file of name calc.l

%{
#include "y.tab.h"
%}

%%
[0-9]+      { return NUMBER; }
[a-zA-Z]+   { return ID; }
[ \t]       ;
\n           { return '\n'; }
.           { return yytext[0]; }
%%

int yywrap(){ return 1; }

for running program
yacc -d calc.y
flex calc.l
gcc y.tab.c lex.yy.c 
./a.out