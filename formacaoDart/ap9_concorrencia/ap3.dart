void main() async{
  print('Iniciando lançamento');

  // todo: implementar contagem regressiva
  for(int i=10; i>0; i--){
    print("$i!");
    await Future.delayed(Duration(seconds: 1));
  }
  print('Foguete lançado!');
}