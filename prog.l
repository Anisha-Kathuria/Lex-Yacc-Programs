%{
	#include<stdio.h>
%}

%%

[ \t]+$		;
[ \t]+		printf(" ");
%%

int yywrap() {
	return 1;
}

int main(int argc, char *argv[]) {

	if(argc!=2) {
		printf("\nUsage: a.exe filename");
		return 0;
	}

	yyin=fopen(argv[1],"r");
	yylex();

	fclose(yyin);
	return 0;
}