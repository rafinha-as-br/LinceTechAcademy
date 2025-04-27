import 'dart:math';

//classe abstrata calculadora
abstract class Calculadora{
  static int dobro(int numeroRecebido){
    int dobro;
    dobro = numeroRecebido*2;
    return dobro;
  }
}

void main(){
  //gerando numero aleatório
  int numeroAleatorio = Random().nextInt(100);
  final dobro = Calculadora.dobro(numeroAleatorio);
  print("O dobro de $numeroAleatorio eh: $dobro");
}