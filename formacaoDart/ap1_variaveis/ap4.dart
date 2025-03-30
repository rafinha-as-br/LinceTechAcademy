import 'dart:math';

void main(){
  //declarando as duas variáveis aleatórias
  int valor1 = Random().nextInt(100);
  int valor2 = Random().nextInt(100);

  //divindo a primeira variável pela segunda
  double resultado = valor1/valor2;

  //truncando o resultado da divisão
  int resultadoTruncado = resultado.truncate();

  //imprimindo todas as variáveis
  print("Imprimindo todas as variáveis \n");
  print("Valor aleatório 1: $valor1");
  print("Valor aleatório 2: $valor2");
  print("Resultado da divisão: $resultado");
  print("Parte inteira deste resultado: $resultadoTruncado");
}