%{
  #include <stdio.h>
  int yylex(void);    
  int variables[26];
  int yyerror(char *errorMsg);
%}

%start start

%token DIGIT LETTER

%left '|'
%left '&'
%left '+' '-'
%left '*' '/' '%'
%left UMINUS      

%%

start:  /*empty */
  | start statement '\n'	
  ;

statement:  exp           	{ printf("Ans = %d",$1); printf("\n\n");}
  |    LETTER '=' exp  	 	  { variables[$1] = $3;		            	  }
  ;

exp: '(' exp ')' 			      { $$ = $2;  	   						            }
  |	exp '*' exp				      {	$$ = $1 * $3;						              }
  |	exp '/' exp 			      {	$$ = $1 / $3;						              }
  |	exp '%' exp   		    	{	$$ = $1 % $3;   					            }
  |	exp '+' exp			      	{	$$ = $1 + $3;						              }
  |	exp '-' exp				      {	$$ = $1 - $3;						              }
  |	exp '&' exp				      {	$$ = $1 & $3;						              }
  |	exp '|' exp				      {	$$ = $1 | $3;					               	}
  |	'-' exp %prec UMINUS  	{	$$ = -$2;							                }
  |	LETTER					        {	$$ = variables[$1];					          }
  |	DIGIT                   { $$ = $1;                              }
  ;

%%

