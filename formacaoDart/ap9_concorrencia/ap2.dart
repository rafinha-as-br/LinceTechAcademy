//função que simula baixar as imagens
Future<void> baixarImagens(List <String> urls) async{
  await Future.delayed(Duration(seconds: 2));
  print("Obtendo as imagens...");
  await Future.delayed(Duration(seconds: 2));
  try{
    //imprimindo cada mensagem dentro de um for pois o await não funciona em um forEach
    for(int i=0; i<urls.length; i++){
      await Future.delayed(Duration(seconds: 1));
      print("Imagem <${urls[i]}> baixada com sucesso!");
    }
  } finally{
    await Future.delayed(Duration(seconds: 1));
    print("Dowloads concluídos!");
  }

}

Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  await baixarImagens(urls);
}