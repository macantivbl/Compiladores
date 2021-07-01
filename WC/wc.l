%{
#include <iostream>
#include <fstream>
using namespace std;
int palabras = 0;
int caracteres = 0;
int lineas = 1;           
%}

%option c++
%option yylineno
%option noyywrap

espacio [ /t/n/r]
palabra [a-zA-Z]+

%%

{palabra} {
	palabras ++;
	caracteres += yyleng;
	}

{espacio} { caracteres += yyleng;}

"\n" {
	lineas++;
	caracteres++;

	}
<<EOF>> {
	cout<<lineas<<" "<<palabras<<" "<<caracteres<<endl;
	return 0;
	}

. {}

%%

int yyFlexLexer::yywrap(){
	return 1;
}