/*{;,int,float,double,",",id,:=,+,-,*,/,%,(, ),numero*/
%{
#include <iostream>
#include "tokens.h"
using namespace std;
%}

%option c++
%option yylineno

letra [a-zA-Z_]
id {letra}({letra}|[0-9])
entero [0-9]+
decimal {entero}?\.{entero}

%%
";" { return PYC;}
"int" { return INT;}
"float" { return FLOAT;}
"double" { return DOUBLE;}
{id} { return ID;}
"," { return COMA;}
":=" { return IGUAL;}
"+" { return MAS;}
"-" { return MENOS;}
"*" { return MUL;}
"/" { return DIV;}
"%" { return MOD;}
"(" { return PARI;}
")" { return PARD;}
{entero} { return NUMERO;}
{decimal} { return NUMERO;}
[ \t\n\r]+ {}
.	{
		printf("Error lexico %s en la linea %d\n", yytext, yylineno);
		return -1;
	}
%%
int yyFlexLexer::yywrap(){
	return 1;
}