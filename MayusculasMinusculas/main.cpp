#include <iostream>
#include <FlexLexer.h>
#include <fstream>
using namespace std;

int main(int argc, char const *argv[]){

	if(argc<2){
		cout<<"faltan arguentos"<<endl;
		return-1;
	}

	ifstream file(argv[1]);
	if(!file.is_open()){
		cout<<"Error al abrir"<<argv[1]<<endl;
		return-1;
	}

	yyFlexLexer lexer(&file);
	lexer.yylex();
	file.close();
	return 0;
}