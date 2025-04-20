import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path/path.dart';

// classe de dados que guarda as informações
class Dados {
  final String estado;
  final DateTime dataHora;
  final double temperatura;
  final double umidade;
  final double velVento;
  final double dirVento;

  Dados({required this.estado, required this.dataHora, required this.temperatura,
    required this.umidade, required this.velVento, required this.dirVento});
}

//função de ler arquivos
Future<List<Dados>> lerArquivos(Directory dir) async {
  if(!await dir.exists()) {
    throw Exception("Diretório não encontrado!");
  }

  //verificador de arquivos .csv
  final arquivos = dir.listSync().where((element) => element is File && element.path.endsWith('.csv'));
  List<Dados> registros = [];

  for(var file in arquivos) {
    final arquivoNome = basename(file.path);
    final estado = arquivoNome.split('_')[0];
    final entrada = File(file.path).openRead();
    final linhas = await entrada.transform(latin1.decoder).transform(CsvToListConverter()).toList();

    // exceptions
    if(linhas.isEmpty) {
      throw Exception("Erro ao converter alguma das linhas!");
    }

    //for que percorre cada linha de cada arquivo
    for(int i = 1; i < linhas.length; i++) {
      var linha = linhas[i];

      try {
        // otendo as datas
        final mes = linha[0] is String ? int.parse(linha[0]) : (linha[0] as num).toInt();
        final dia = linha[1] is String ? int.parse(linha[1]) : (linha[1] as num).toInt();
        final hora = linha[2] is String ? int.parse(linha[2]) : (linha[2] as num).toInt();

        //armazenando as datas dentro de uma variável dateTime
        final dataHora = DateTime(DateTime.now().year, mes, dia, hora);

        // obtendo os dados baseado nos índices
        final temperatura = linha[3] is String ? double.parse(linha[3]) : (linha[3] as num).toDouble();
        final umidade = linha[4] is String ? double.parse(linha[4]) : (linha[4] as num).toDouble();
        final velocidadeVento = linha[5] is String ? double.parse(linha[5]) : (linha[5] as num).toDouble();
        final ventoDirecao = linha[6] is String ? double.parse(linha[6]) : (linha[6] as num).toDouble();

        // adicionando os dados na classe
        registros.add(Dados(
            estado: estado,
            dataHora: dataHora,
            temperatura: temperatura,
            umidade: umidade,
            velVento: velocidadeVento,
            dirVento: ventoDirecao
        ));

        // mais exceptions
      } catch (e) {
        print("Erro ao processar a linha: $e");
        print("Linha com problema: $linha");
      }
    }
  }

  return registros;
}