import 'dart:io';

bool ehAnoBissexto (int ano){
  bool resultado = false;
  if(ano%4 == 0 && ano%100 != 0){

    if(ano%400 == 0){
      resultado = false;
    }

    resultado = true;
  }
  return resultado;
}

void main(){
  print("Informe o ano que você deseja verificar: ");
  int ano = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  ehAnoBissexto(ano) ? print("$ano É bissexto") : print("$ano Não é bissexto");
}