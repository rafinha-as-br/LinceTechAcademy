import 'dart:io';

import 'leitorCSV.dart';

//função de gerar relatório
Future<void> criarRelatorio(int opc, Directory dir) async{
  List<Dados> registros = await lerArquivos(dir);

  //exception registros vazio
  if(registros.isEmpty){
    throw Exception("Registros vazios!");
  }

  //armazenando um map com os estados como key
  var estados = <String, List<Dados>>{};
  for(var dado in registros){
    estados.putIfAbsent(dado.estado, ()=>[]).add(dado);
  }

  for(var estado in estados.keys){
    var dadoEstado = estados[estado]!;

    print("\nEstado: $estado");
    //relatorio temperatura
    if(opc == 1){
      print("Relatório temperaturas $estado");
      //soma todas as temperaturas
      double somaTemp = dadoEstado.fold(0.0, (total, d)=> total + d.temperatura);
      //pegar média
      double mediaTemp = somaTemp/dadoEstado.length;

      //pegando a temp máx e min
      double tempMax = dadoEstado.map((d)=> d.temperatura).reduce((a,b) => a>b ? a:b);
      double tempMin = dadoEstado.map((d)=> d.temperatura).reduce((a,b) => a<b ? a:b);

      print("Média anual: ${mediaTemp.toStringAsFixed(2)}Cº");
      print("Máxima do ano: ${tempMax.toStringAsFixed(2)}Cº");
      print("Mínima do ano: ${tempMin.toStringAsFixed(2)}Cº");

      //pegando os valores mensais
      print("\n\nMédias dos meses de $estado:");
      var Mes = <int, List<Dados>>{};
      for (var dado in dadoEstado){
        Mes.putIfAbsent(dado.dataHora.month, ()=> []).add(dado);

      }

      Mes.forEach((mes, lista){
        double media = lista.fold(0.0, (total,d) => total + d.temperatura)/lista.length;
        print(" - Mês $mes: ${media.toStringAsFixed(2)}Cº");
      });

      //relatório umidade
    } else if(opc ==2){
      print("Relatório: Umidade $estado");
      double somaUmidades = dadoEstado.fold(0.0, (total, d) => total + d.umidade);
      double mediaUmid = somaUmidades / dadoEstado.length;
      double umidadeMax = dadoEstado.map((d)=> d.umidade).reduce((a,b)=> a>b ? a:b);
      double umidadeMin = dadoEstado.map((d)=> d.umidade).reduce((a,b)=> a<b ? a:b);

      print("Umidade média anual: ${mediaUmid.toStringAsFixed(2)}%");
      print("Umidade máxima anual: ${umidadeMax.toStringAsFixed(2)}%");
      print("Umidade mínima anual: ${umidadeMin.toStringAsFixed(2)}%");

      //relatório vento
    } else if(opc==3){
      print("Relatório vento $estado");
      Map<double, int> freqDir = {};
      for(var d in dadoEstado){
        freqDir[d.dirVento] = (freqDir[d.dirVento]?? 0 ) +1;


      }
      var maiorFrequente = freqDir.entries.reduce((a,b)=> a.value > b.value ? a:b);
      print("Direção de vento mais frequente: ${maiorFrequente.key}º");
    }


  }






}