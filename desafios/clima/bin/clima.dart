import 'dart:io';
import 'gerarRelatorio.dart';
import 'package:ansi/ansi.dart';


void main() async{
  print("Olá Leandro! Que relatório você precisa?");
  print("${red("1 - Temperatura")}");
  red("Teste");
  print('\x1B[31mTexto vermelho\x1B[0m');
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
