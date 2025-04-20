import 'dart:io';
import 'gerarRelatorio.dart';

void main() async{
  //menu principal
  print("Olá Leandro! Que relatório você precisa?");
  print("1 - Temperatura");
  print("2 - Umidade");
  print("3 - Direção do vento");
  print("4 - Para sair");

  int opcao = int.tryParse(stdin.readLineSync()?? "")?? 0;
  final dir = Directory('arquivosCSV');
  try{
    await criarRelatorio(opcao, dir);
  } catch (e){
    print("erro ao gerar relatório");
  }
}
