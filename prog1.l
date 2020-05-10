%{
#include<stdio.h>
%}

%%
[ \t]+$	{printf("");}
.	{printf("%s",yytext);}
%%

int yywrap()
{
  return 1;
}

int main()
{
/*Program Assignments:- 
 Write a lex program to delete from the input all blanks or tabs at the end of lines.
*/
 yyin = fopen("Input1.txt","r");

 yylex();    
 return 0;
}