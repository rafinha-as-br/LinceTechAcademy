import 'dart:io';

//função que recebe uma lista de numeros e retorna outra lista de numeros
List <int> retornaImpares (List <int> numerosRecebidos) {
  List <int> listaDeImpares = [];
  for (int i=0; i<numerosRecebidos.length; i++){
    if(numerosRecebidos[i] %2 != 0){
      listaDeImpares.add(numerosRecebidos[i]);
    }
  }
  return listaDeImpares;
}

void main(){
  //criando lista de números a partir de zero;
  List <int> listaNumeros = [];

  //pegando o valor limite
  print("Informe a quantidade máximas de números da sua lista a partir de 0: ");
  int tamanho = int.tryParse(stdin.readLineSync()?? "")?? 1;
  int i=0;
  while(tamanho > 0){
    listaNumeros.add(i);
    i++;
    tamanho--;

  }

  //lista que recebe a função
  List <int> numerosImpares = retornaImpares(listaNumeros);

  //imprimindo a lista
  numerosImpares.forEach((element) => print("Impar: $element"));
  
}