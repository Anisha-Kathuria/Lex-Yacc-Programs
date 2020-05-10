%{ 
  #include<stdio.h>  
  #include "calculator.tab.h" 
  extern int yylval; 
  int c;
%} 

%%
[ \t]       	;
"quit"			{ 
                    exit(0);	
                }
"exit"			{ 
                    exit(0);	
                }
[a-z]     		{
                    c = yytext[0]; 
                    yylval = c - 'a';  
                    return(LETTER); 
                }

[0-9]+          { 
					yylval = atoi(yytext); 
					return(DIGIT); 
				}
[^a-z0-9]       {
                    c = yytext[0];
                    return(c);  
                }
%%


int yywrap() {
  return 1;
}


int yyerror(char *errorMsg){
    fprintf(stderr, "\n%s\n", errorMsg);
    exit(1);
}

int main() {
    printf("\n###################-----Anisha's Calculator-----######################\n");
    printf("\nEnter your expression in the following form: \n");
    printf("\n------------");
    printf("\n2*3+4");
    printf("\n-----OR-----");
    printf("\na=8*4\nb=4\na+b");
    printf("\n------------\n\n");
    yyparse();  
    return 0;
}