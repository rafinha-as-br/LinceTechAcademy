import 'dart:math';

//função A que recebe outra função como parâmetro
int funcaoA(int Function(int) funcaoRecebida){
  int numeroAleatorio1 = Random().nextInt(15);
  int numeroAleatorio2 = Random().nextInt(5);
  int resultado = 0;
  resultado = funcaoRecebida(numeroAleatorio1) + funcaoRecebida(numeroAleatorio2);
  return resultado;
}

//função B
int funcaoB(int numero){
  int resultado;
  resultado = numero++; //operação escolhida: somar mais um
  return resultado;
}
//Função C
int funcaoC(int numero){
  int resultado;
  resultado = numero-4; //operação escolhida: subtrair 4
  return resultado;
}

void main(){
  //variáveis que recebem o retorno das duas questões
  final resultadoA = funcaoA(funcaoB);
  final resultadoB = funcaoA(funcaoC);
  //imprimindo as duas variáveis
  print("Resultado função A: $resultadoA");
  print("Resultado função B: $resultadoB");
}