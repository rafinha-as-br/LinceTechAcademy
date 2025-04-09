import 'dart:math';

//função que recebe uma lista de núemros e retorna uma lista de strings do alfabeto convertido
List <String> retornaLetra(List <int> numeros){
  List <String> alfabeto = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  List <String> numerosConvertidos = [];
  int j;
  for(int i=0; i<5; i++){
    j = numeros[i];
    numerosConvertidos.add(alfabeto[j]);
  }

  return numerosConvertidos;
}

void main() {
  //criando lista com 5 numeros aleatórios
  List <int> numeros = List.generate(5, (_) => Random().nextInt(26));
  //criando a lista que recebe a função
  List <String> numerosConvertidos = retornaLetra(numeros);

  //loop de impressão das coversões
  for(int i=0; i<numerosConvertidos.length; i++){
    print("Numero ${numeros[i] + 1 } -> Letra ${numerosConvertidos[i]}");
  }
}