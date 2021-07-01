%{
#include <iostream>
#include <fstream>
using namespace std;
ofstream salida("salida.txt",ios::out)
%}

%option c++
%option yylineno

espacio [ /t/n/r]
palabra [a-z]+

%%

{palabra}/{espacio} {
	for(int i = 0; i<yyleng; i++){
		yytext[i] = toupper(yytext[i]);
	}salida<<yytext;
	}

{espacio} { salida<<yytext;}

<<EOF>> {
	salida.close();
	return 0;
	}

. {}

%%

int yyFlexLexer::yywrap(){
	return 1;
}