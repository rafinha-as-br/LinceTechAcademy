import 'dart:convert';
import 'dart:io';

//diretório da pasta de cada estado
final pastaSC = Directory('arquivosCSV/SC');
final pastaSP = Directory('arquivosCSV/SP');



// função que vai retornar uma lista com todos os dados
Map <int, Map<int, Map<int, List<String>>> >? processarDados(Directory pasta){
  // estururas de mapa
  final mapaMeses = <int, Map<int, Map<int, List<String>>> > {};
  final mapaDias =  <int, Map<int, List<String>>> {};
  final mapaHoras = <int, List<String>>{};

  //criando variáveis necessárias
  List <FileSystemEntity> arquivosCSV = [];
  //pegando os arquivos .csv do diretório passado
  pasta.existsSync() ? arquivosCSV = pasta.listSync().where((element) => element is File && element.path.endsWith('.csv')).toList() : throw Exception("Não foi possível obter os arquivos!");

  for (final arquivo in arquivosCSV){
    final values = arquivo as File;
    final linhas = values.readAsLinesSync(encoding: latin1);
    final dados = linhas.skip(1);

    for (var linha in dados) {
      final partes = linha.split(',');
      final dia = int.parse(partes[1]);
      final hora = int.parse(partes[2]);

      // adiciona a hora ao mapa do dia
      mapaDias.putIfAbsent(dia, () => {});
      mapaDias[dia]![hora] = partes;
    }

    // extrair mês do nome do arquivo
    final nomeArquivo = arquivo.uri.pathSegments.last;
    final partesNome = nomeArquivo.split('_');
    final mes = int.parse(partesNome[2].split('.').first);

    mapaMeses[mes] = mapaDias;



  }

  return mapaMeses;
}


/*
  //passando por cada mês (cada arquivo)
  for(int i=0; i<arquivosCSV.length; i++){
    //passando por cada arquivo e armazenando o conteúdo em uma lista
    final arquivoFile = arquivosCSV[i] as File;
    List<String> arquivo = arquivoFile.readAsLinesSync(encoding: latin1);
    final dados = arquivo.skip(1);
    //processando os dias através dos arquivos


    int j=1;
    while(j!= arquivo.skip(1).map((linha)=> linha.split(',')[1]).toSet().length){

      //processando as horas
      for(int h=1; h<24; h++){
        String info = arquivo[j].toString();
        List <String> infoList = info.split(',');

        //adicionando dados ao mapa das horas
        mapaHoras.putIfAbsent(h, () =>  infoList);
        j++;
      }

      //adicionando horas ao mapa do dia
      mapaDias.putIfAbsent(j, ()=> mapaHoras);

    }

    //adicionando mapa dias ao mapa mes
    mapaMeses.putIfAbsent(i, ()=> mapaDias);

  }
*/


void main(){
  var SC = processarDados(pastaSC);
  print(SC);

}