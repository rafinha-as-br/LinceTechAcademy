import 'dart:io';
import 'dart:math';
import 'package:ansi/ansi.dart';
import 'leitorCSV.dart';

//classes de tipos de temperaturas
class ConversorTemperatura {
  static double celsiusParaFahrenheit(double celsius) => (celsius * 9/5) + 32;
  static double celsiusParaKelvin(double celsius) => celsius + 273.15;
}
//classes de tipos de direções
class ConversorAngulo {
  static double grausParaRadianos(double graus) => graus * (pi / 180);
  static double radianosParaGraus(double radianos) => radianos * (180 / pi);
}





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

      //imprimindo os valores
      print("Média anual: ${red(mediaTemp.toStringAsFixed(2) + "Cº" )} " + "|" + " ${yellow(ConversorTemperatura.celsiusParaFahrenheit(mediaTemp).toStringAsFixed(2) + "Fº")} " + "|" + " ${blue(ConversorTemperatura.celsiusParaKelvin(mediaTemp).toStringAsFixed(2) + "K")} ");
      print("Máxima do ano: ${red(tempMax.toStringAsFixed(2) + "C")} " + "|" + " ${yellow(ConversorTemperatura.celsiusParaFahrenheit(tempMax).toStringAsFixed(2) + "Fº")} " + "|" + " ${blue(ConversorTemperatura.celsiusParaKelvin(tempMax).toStringAsFixed(2) + "K")}");
      print("Mínima do ano: ${red(tempMin.toStringAsFixed(2) + "C")} " + "|" + " ${yellow(ConversorTemperatura.celsiusParaFahrenheit(tempMin).toStringAsFixed(2) + "Fº")} " + "|" + " ${blue(ConversorTemperatura.celsiusParaKelvin(tempMin).toStringAsFixed(2) + "K")}");

      //pegando os valores mensais
      print("\n\nMédias dos meses de $estado:");
      var Mes = <int, List<Dados>>{};
      for (var dado in dadoEstado){
        Mes.putIfAbsent(dado.dataHora.month, ()=> []).add(dado);

      }

      Mes.forEach((mes, lista){
        double media = lista.fold(0.0, (total,d) => total + d.temperatura)/lista.length;
        print(" - Mês $mes: ${red(media.toStringAsFixed(2) + "Cº")} " + "|" + " ${yellow(ConversorTemperatura.celsiusParaFahrenheit(media).toStringAsFixed(2)+ "Fº")}" + "|" + " ${blue(ConversorTemperatura.celsiusParaKelvin(media).toStringAsFixed(2) + "K")}");
      });

      //relatório umidade
    } else if(opc ==2){
      print("Relatório: Umidade $estado");
      double somaUmidades = dadoEstado.fold(0.0, (total, d) => total + d.umidade);
      double mediaUmid = somaUmidades / dadoEstado.length;
      double umidadeMax = dadoEstado.map((d)=> d.umidade).reduce((a,b)=> a>b ? a:b);
      double umidadeMin = dadoEstado.map((d)=> d.umidade).reduce((a,b)=> a<b ? a:b);

      print("Umidade média anual: ${green(mediaUmid.toStringAsFixed(2) + "%")}");
      print("Umidade máxima anual: ${red(umidadeMax.toStringAsFixed(2)+ "%")}");
      print("Umidade mínima anual: ${blue(umidadeMin.toStringAsFixed(2)) + "%"}");

      //relatório vento
    } else if(opc==3){
      print("Relatório vento $estado");

      // Direção mais frequente no ano todo
      Map<double, int> freqAnual = {};
      for (var d in dadoEstado) {
        freqAnual[d.dirVento] = (freqAnual[d.dirVento] ?? 0) + 1;
      }
      var dirMaisFreqAno = freqAnual.entries.reduce((a, b) => a.value > b.value ? a : b);
      print("Direção de vento mais frequente no ano: ${blue("${dirMaisFreqAno.key}º")}");

      // Direção mais frequente por mês
      print("\nDireção de vento mais frequente por mês:");
      var porMes = <int, List<Dados>>{};
      for (var d in dadoEstado) {
        porMes.putIfAbsent(d.dataHora.month, () => []).add(d);
      }

      porMes.forEach((mes, lista) {
        Map<double, int> freqMes = {};
        for (var d in lista) {
          freqMes[d.dirVento] = (freqMes[d.dirVento] ?? 0) + 1;
        }
        var dirMaisFreqMes = freqMes.entries.reduce((a, b) => a.value > b.value ? a : b);
        print(" - Mês $mes: ${yellow(dirMaisFreqMes.key.toString()) + "º"} | ${yellow(ConversorAngulo.grausParaRadianos(dirMaisFreqMes.key).toStringAsFixed(2))  + " Rad"} (${dirMaisFreqMes.value} ocorrências) ");
      });
    }


  }






}
