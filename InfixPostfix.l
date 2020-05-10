%{
    #include <stdio.h>
    #include "InfixPostfix.tab.h"
    extern int yylval; 
    int yyerror(char *errorMsg);
%}

%%
[ \t]       	  ;
"quit"			{ exit(0);                              }
"\n"            { return 0;                             }
[()*/+-]        { return yytext[0];                     }
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z]        { yylval=yytext[0]; return LETTER;      }
.               { yyerror("INVALID TOKEN");             }
%%

int yywrap() {
  return 1;
}

int yyerror(char *errorMsg){
    fprintf(stderr, "\n%s\n", errorMsg);
    exit(1);
}


int main() {
    printf("\n~~~~~~~~~~~~~~~ Infix to Postfix ~~~~~~~~~~~~~~~~\n");
    printf("\nEnter your expression as follows : \n");
    printf("\n(2*3+6)+6\n");
    printf("\n-------------\n\n");
    yyparse();
    return 0;
}


