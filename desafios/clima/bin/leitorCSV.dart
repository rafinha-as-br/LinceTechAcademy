import 'dart:io';



void main(){
//diretório da pasta principal
  final pasta = Directory('arquivosCSV');

//variáveis de cada estado botar isso dentro do main depois
  final dadosSC;
  final dadosSP;

//mapas

//função processarDadosSC
  // vai ser um while que processa CADA arquivo que contenha "SC" no nome
    // pegar arquivos do diretório que contenha apenas SC no nome
    // cada vez vai chamar a função obter dados

//função obter dados



//função que obtém o os conteúdos CSV
  List<String> obterDados(){
    //verifica se a pasta está funcionando, se estiver, obter todo arquivo ".csv"
    pasta.existsSync() ? arquivosCSV = pasta.listSync().where((element) => element is File && element.path.endsWith('.csv')).toList() : throw Exception("Não foi possível obter os arquivos!");
    List <String> conteudoCSV;
    //lendo os arquivos .csv
    try{
      arquivosCSV.forEach((arquivo) {
        conteudoCSV = (File(arquivo.path).readAsLinesSync());
      });
    } catch (e){
      throw e;
    }

    //retorna o conteúdo CSV
    return conteudoCSV;
  }

// Função obter dados:
  // receber um arquivo específico

//função processarArquivo (recebe uma variável com o conteúdo do CSV)


}