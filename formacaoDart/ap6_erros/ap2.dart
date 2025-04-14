// função que recebe um inteiro e vetifica se é par
import 'dart:io';

bool verificador (String valorRecebido){
  //declarando variáveis base da função
  bool info = true;
  int valor = 0;
  //convertendo o valor para int
  try{
    valor = int.parse(valorRecebido);
  } catch(e){
    print("Este valor não é válido como número!");
    info = false;
  }

  if(info==true){
    if(valor%2 == 0){
      print("Entrada correta, você inseriu um número par!");
    } else{
      throw Exception("Entrada inválida, insira apenas números pares!");
    }
  }

  return info;

}



void main(){
  //obtendo valor do usuário


  //chamando a função dentro de um loop para lidar com as excessões
  bool info = false;
  while(info == false){
    print("Informe um valor: ");
    String valor = stdin.readLineSync()?? "";
    info = verificador(valor);
  }

}