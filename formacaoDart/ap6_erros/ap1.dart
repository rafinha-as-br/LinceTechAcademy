//função que converte de String para inteiro
import 'dart:io';

void converterStrings (String stringRecebida){

  try{
    int stringConvertida = int.parse(stringRecebida);
    print("O valor informado foi um número válido!");
  } catch(e){
    print("O valor informado não é um número válido para a conversão!");
  }
}

void main(){
  print("Informe um valor: ");
  String valor = stdin.readLineSync()?? "";

  //chamando a função...
  converterStrings(valor);
}