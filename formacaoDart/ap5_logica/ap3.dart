//função que recebe um número e retorna a soma dos números pares até o número recebido

import 'dart:math';

int somaPares (int num1){
  int num01=1;
  int somaPares = 0;
  while (num01 < num1){
    if(num01%2 == 0){
      somaPares += num01;
    }
    num01++;
  }

  return somaPares;
}


void main(){
  int numeroAleatorio = Random().nextInt(1000 - 100 + 1);
  int somaDePares = somaPares(numeroAleatorio);
  print("A soma dos pares entre 0 e $numeroAleatorio = $somaDePares");
}