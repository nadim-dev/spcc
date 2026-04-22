%{

#include <stdio.h>
int characters=0, words=0, lines=0;
int spaces=0, tabs=0, numbers=0, sentences=0;
%}

%%

[a-zA-Z]+ {words++; characters+=yyleng;}
[0-9]+    {numbers++; characters+=yyleng;}
[.]+      {sentences++;characters++;}
\n        {lines++;characters++;}
" "       {spaces++;characters++;}
\t        {tabs++;characters++;}
.         {characters++;}

%%

int yywrap(){
    return 1;
}

int main(){
    printf("Enter the text");
    yylex();
    printf("\nCharacters = %d", characters);
    printf("\nWords      = %d", words);
    printf("\nLines      = %d", lines);
    printf("\nSpaces     = %d", spaces);
    printf("\nTabs       = %d", tabs);
    printf("\nNumbers    = %d", numbers);
    printf("\nSentences  = %d\n",sentences);

    return 0;
}

#program to run 
flex counter.l
gcc lex.yy.c -ll (either user gcc or cc)
./a.out 
(after entering input terminate by cntrl d)