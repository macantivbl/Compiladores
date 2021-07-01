%{
#include <iostream>
#include "tokens.h"
#include <fstream>
using namespace std;
        
%}

%option c++
%option yylineno
%option noyywrap

numeros [0-9]+
enteros {numeros}
exp ({eE}[+-]?{entero})
reales {enteros}?\.{enteros}{exp}?|{entero}{exp}
letra [a-zA-Z]+
identificador {letra}({letra}|[0-9])
caracteres (/"{identificador}/")
palReser (if|then|else|while|do|case|is|void|true|false|begin|end|not)
espacio [ /t/n/r]
comentarios (--.+\n)
comentariosMulti ("<*"~("*>")*"*>")
operadores [+-*/%]
operadoresRela [><=]|"<>"
asignacion (":=")
simbolosEspe [(){},;]


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