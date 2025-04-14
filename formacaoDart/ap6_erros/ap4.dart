//interface abstrata arquivo
import 'dart:io';

abstract class Arquivo {
  void abrir(nomedoArquivo);
}

//classe arquivo que implementa a interface

class arquivoTexto implements Arquivo{
  final String nome;

  arquivoTexto(this.nome);

  @override
  void abrir(nomedoArquivo){
    try{
      if(nomedoArquivo== "arquivo1.txt" || nomedoArquivo=="arquivo2.html"){
        print("Arquivo $nomedoArquivo aberto!");
      } else{
        throw Exception("Erro ao abrir o arquivo $nome");
      }
    } catch (e){
      print("Relançando exception");
      rethrow;
    }
  }
}


void main(){
  try{
    //obtendo nome do arquivo com o usuário
    print("Arquivos disponíveis: ");
    print("\n arquivo1.txt");
    print("\n arquivo2.html\n");
    print("informe o nome do arquivo que desejas abrir: ");
    final nomeArquivo = stdin.readLineSync()?? "";

    arquivoTexto arquivoTxt = arquivoTexto(nomeArquivo);
    arquivoTxt.abrir(nomeArquivo);

  }catch(e) {
    print(e);
  } finally {
    print("Fim do programa");
  }


}