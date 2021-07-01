%{
    #include <iostream>
    #include "tokens.h"
    using namespace std;
%}

%option c++
%option yylineno
%option noyywrap

entero [0-9]+
exp ([eE][+-]?{entero})
real {entero}?\.{entero}{exp}?|{entero}{exp}
id [a-zA-Z_][a-zA-Z_0-9]*
str \"([\x20-\x21\x23-\xFE])*\"
espacio [ \t\n\r]+
comline "--",*\n

%s COMENTARIO

%%

<INITIAL>"if" {return IF;}
<INITIAL>"then"    {return THEN;}
<INITIAL>"else"    {return ELSE;}
<INITIAL>"while"    {return WHILE;}
<INITIAL>"do"    {return DO;}
<INITIAL>"case"    {return CASE;}
<INITIAL>"is"    {return IS;}
<INITIAL>"void"    {return VOID;}
<INITIAL>"true"    {return TRUE;}
<INITIAL>"false"    {return FALSE;}
<INITIAL>"begin"    {return TBEGIN;}
<INITIAL>"end"    {return TEND;}
<INITIAL>"not"    {return NOT;}
<INITIAL>"+"    {return MAS;}
<INITIAL>"-"    {return MENOS;}
<INITIAL>"*"    {return MUL;}
<INITIAL>"/"    {return DIV;}
<INITIAL>"%"    {return MOD;}
<INITIAL>">"    {return MAY;}
<INITIAL>"<"    {return MEN;}
<INITIAL>"<>"    {return DIF;}
<INITIAL>"="    {return IGUAL;}
<INITIAL>":="   {return ASIG;}
<INITIAL>"("    {return PARI;}
<INITIAL>")"    {return PARD;}
<INITIAL>"{"    {return LLI;}
<INITIAL>"}"    {return LLD;}
<INITIAL>";"    {return PYC;}
<INITIAL>","    {return COMA;}
<INITIAL>{comline} {}
<INITIAL>{espacio} {}
<INITIAL>{entero} {return ENTERO;}
<INITIAL>{real} {return REAL;}
<INITIAL>{id} {return ID;}
<INITIAL>{str} {return STR;}
<INITIAL>"<*"   {BEGIN(COMENTARIO);}
<INITIAL>.  {printf("Error lexico: %s en la linea\n %d", yytext, yylineno);}

<COMENTARIO>[^*>] {}
<COMENTARIO>[*>]  {}
<COMENTARIO>"*>"    {BEGIN(INITIAL);}
%%