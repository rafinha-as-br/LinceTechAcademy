//função buscar dados
Future <void> buscarDados() async{
  await Future.delayed(Duration(seconds: 4));

}

void main() async{
  print("Buscando dados...");
  await buscarDados();
  print("Busca concluída!");
}