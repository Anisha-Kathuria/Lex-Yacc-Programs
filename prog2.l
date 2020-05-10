%{
#include<stdio.h>
%}

%%
[ \t]+	{fprintf(yyout," ");}
.	{fprintf(yyout,"%s",yytext);}
%%

int yywrap()
{
  return 1;
}

int main()
{
/*Program Assignments:- 
 To change strings of blanks or tabs to a single blank.*/
 yyin = fopen("Input.txt","r");
 yyout = fopen("Output.txt","w");

 yylex();
 return 0;
}