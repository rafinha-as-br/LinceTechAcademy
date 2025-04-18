import 'dart:convert';
import 'dart:io';



void main(){
//diretório da pasta de cada estado
  final pastaSC = Directory('arquivosCSV/SC');
  final pastaSP = Directory('arquivosCSV/SP');


// esturura de mapa
  final Map<String, Map<int, Map<int, List<Map<String, dynamic>>>>> dadosClimaticos = {
    'SC': {},
    'SP': {},
  };


//função processarDados => recebe o diretório da pasta dos arquivos de determinado estado

  //if que vê qual estado foi passado{
    // um for que processa CADA arquivo da pasta (processa cada mês){

      // pegar arquivo .csv da pasta daquele estado
      // ler arquivo e armazenar em uma lista

      // um for que processará cada dia{
        // um for que processará cada hora{
          // pega os dados de cada hora e coloca em um mapa de horas do dia processado
          // pega o mapa de horas e coloca dentro do mapa do dia
        //}

      // }

      // pega o mapa do dia e joga no mapa do mês
    // }
  //}


  // função que vai retornar uma lista com todos os dados
  void processarDados(Directory pasta){
    //criando variáveis necessárias
    List <FileSystemEntity> arquivosCSV = [];
    //pegando os arquivos .csv do diretório passado
    pasta.existsSync() ? arquivosCSV = pasta.listSync().where((element) => element is File && element.path.endsWith('.csv')).toList() : throw Exception("Não foi possível obter os arquivos!");


    //processar Dados SC
    if(pasta == "SC"){
      //passando por cada mês (cada arquivo)
      for(int i=0; i<arquivosCSV.length; i++){
        //passando por cada arquivo e armazenando o conteúdo em uma lista
        final arquivoFile = arquivosCSV[i] as File;
        List<String> arquivo = arquivoFile.readAsLinesSync();

        //processando os dias através dos arquivos

      }


    }





  }


//função obter dados => recebe um arquivo CSV e retorna uma lista de String das informações


/*
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
*/
}