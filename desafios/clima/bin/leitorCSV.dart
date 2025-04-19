import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path/path.dart';

// classe que registra os dados de cada linha
class Dados {
  final String estado;
  final DateTime dataHora;
  final double temperatura;
  final double umidade;
  final double velVento;
  final double dirVento;

  Dados({required this.estado, required this.dataHora, required this.temperatura, required this.umidade, required this.velVento, required this.dirVento});

}

//função lerArquivos
Future<List<Dados >> lerArquivos(Directory dir) async{
  //conferir se o diretório existe
  if(!await dir.exists()){
    throw Exception("Diretório não encontrado!");
  }
  //pegando os arquivos dentro do diretório
  final arquivos = dir.listSync().where((element)=> element is File && element.path.endsWith('.csv'));

  //inicializando lista para chamar instâncias da classe
  List <Dados> registros = [];

  for(var file in arquivos){
    final arquivoNome = basename(file.path);
    final estado = arquivoNome.split('_')[0];
    final entrada = File(file.path).openRead();
    final linhas = await entrada.transform(utf8.decoder).transform(CsvToListConverter()).toList();

    if(linhas.isEmpty){
      throw Exception("Erro ao converter alguma das linhas!");
    }

    for(int i=1; i<linhas.length; i++){
      var linha = linhas[i];

      try{
        //armazenando aos valores em variáveis para jogar na lista e depois na classe
        final dataHora = DateTime.parse(linha[0]);
        final temperatura = double.parse(linha[1].toString());
        final umidade = double.parse(linha[2].toString());
        final velocidadeVento = double.parse(linha[3].toString());
        final ventoDirecao = double.parse(linha[4].toString());

        registros.add(Dados(
            estado: estado, dataHora: dataHora,
            temperatura: temperatura, umidade: umidade,
            velVento: velocidadeVento, dirVento: ventoDirecao));

      } catch (e){
        print("Erro ao processar a linha: $e");
      }

    }


  }

  return registros;

}
