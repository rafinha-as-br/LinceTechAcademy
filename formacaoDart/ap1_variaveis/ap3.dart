import 'dart:math';

void main(){
  //declarando as duas variáveis aleatórias
  int valor1 = Random().nextInt(100);
  int valor2 = Random().nextInt(100);

  //imprimindo as mesmas variáveis
  print("O primeiro valor aleatório é: $valor1");
  print("O segundo valor aleatório é: $valor2");

  //invertendo as variáveis
  int valor3 = valor2;
  int valor4 = valor1;

  //imprimindo as variáveis invertidas
  print("\nInvertendo os valores\n");
  print("O primeiro valor agora é: $valor3");
  print("O segundo valor agora é: $valor4");
}