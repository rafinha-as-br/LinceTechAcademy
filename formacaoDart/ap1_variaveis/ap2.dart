
import 'dart:io';

void main(){
  //criando o vetor para armazenar os 4 valores
  final numeros = List.filled(4, 0);
  //criando as variaveis de somaTotal e a média;
  int somaTotal=0;
  double media;

  //Preenchendo o vetor
  print("Informe os números para calcular a média: ");
  for(int i=0; i<4; i++){
    print("Número ${i+1}: ");
    numeros[i] = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
    somaTotal += numeros[i];

  }

  media = somaTotal/4;

  print("A média entre os números: [${numeros[0]}, ${numeros[1]}, ${numeros[2]}, ${numeros[3]}] é = $media");

}