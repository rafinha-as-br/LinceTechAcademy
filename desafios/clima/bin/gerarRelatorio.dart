import 'dart:io';
import 'dart:math';
import 'package:ansi/ansi.dart';
import 'leitorCSV.dart';

// única forma que funcionou as cores para mim...
String vermelho(String texto) => '\x1B[31m$texto\x1B[0m';
String amarelo(String texto) => '\x1B[33m$texto\x1B[0m';
String azul(String texto) => '\x1B[34m$texto\x1B[0m';
String verde(String texto) => '\x1B[32m$texto\x1B[0m';


// classes de tipos de temperaturas
class ConversorTemperatura {
  static double celsiusParaFahrenheit(double celsius) => (celsius * 9 / 5) + 32;
  static double celsiusParaKelvin(double celsius) => celsius + 273.15;
}

// classes de tipos de direções
class ConversorAngulo {
  static double grausParaRadianos(double graus) => graus * (pi / 180);
  static double radianosParaGraus(double radianos) => radianos * (180 / pi);
}

// função de gerar relatório
Future<void> criarRelatorio(int opc, Directory dir) async {
  List<Dados> registros = await lerArquivos(dir);

  // exception registros vazio
  if (registros.isEmpty) {
    throw Exception("Registros vazios!");
  }

  // armazenando um map com os estados como key
  var estados = <String, List<Dados>>{};
  for (var dado in registros) {
    estados.putIfAbsent(dado.estado, () => []).add(dado);
  }

  for (var estado in estados.keys) {
    var dadoEstado = estados[estado]!;

    print("\nEstado: $estado");
    // relatório temperatura
    if (opc == 1) {
      print("Relatório temperaturas $estado");

      double somaTemp = dadoEstado.fold(0.0, (total, d) => total + d.temperatura);
      double mediaTemp = somaTemp / dadoEstado.length;
      double tempMax = dadoEstado.map((d) => d.temperatura).reduce((a, b) => a > b ? a : b);
      double tempMin = dadoEstado.map((d) => d.temperatura).reduce((a, b) => a < b ? a : b);

      print("Média anual: ${vermelho(mediaTemp.toStringAsFixed(2) + "Cº")} | ${amarelo(ConversorTemperatura.celsiusParaFahrenheit(mediaTemp).toStringAsFixed(2) + "Fº")} | ${azul(ConversorTemperatura.celsiusParaKelvin(mediaTemp).toStringAsFixed(2) + "K")}");
      print("Máxima do ano: ${vermelho(tempMax.toStringAsFixed(2) + "C")} | ${amarelo(ConversorTemperatura.celsiusParaFahrenheit(tempMax).toStringAsFixed(2) + "Fº")} | ${azul(ConversorTemperatura.celsiusParaKelvin(tempMax).toStringAsFixed(2) + "K")}");
      print("Mínima do ano: ${vermelho(tempMin.toStringAsFixed(2) + "C")} | ${amarelo(ConversorTemperatura.celsiusParaFahrenheit(tempMin).toStringAsFixed(2) + "Fº")} | ${azul(ConversorTemperatura.celsiusParaKelvin(tempMin).toStringAsFixed(2) + "K")}");

      print("\n\nMédias dos meses de $estado:");
      var Mes = <int, List<Dados>>{};
      for (var dado in dadoEstado) {
        Mes.putIfAbsent(dado.dataHora.month, () => []).add(dado);
      }

      var mesesOrdenados = Mes.keys.toList()..sort();
      for (var mes in mesesOrdenados) {
        var lista = Mes[mes]!;
        double media = lista.fold(0.0, (total, d) => total + d.temperatura) / lista.length;
        print(" - Mês $mes: ${vermelho(media.toStringAsFixed(2) + "Cº")} | ${amarelo(ConversorTemperatura.celsiusParaFahrenheit(media).toStringAsFixed(2) + "Fº")} | ${azul(ConversorTemperatura.celsiusParaKelvin(media).toStringAsFixed(2) + "K")}");
      }

      //relatório umidade
    } else if (opc == 2) {
      print("Relatório: Umidade $estado");

      double somaUmidades = dadoEstado.fold(0.0, (total, d) => total + d.umidade);
      double mediaUmid = somaUmidades / dadoEstado.length;
      double umidadeMax = dadoEstado.map((d) => d.umidade).reduce((a, b) => a > b ? a : b);
      double umidadeMin = dadoEstado.map((d) => d.umidade).reduce((a, b) => a < b ? a : b);

      print("Umidade média anual: ${verde((mediaUmid * 100).toStringAsFixed(2) + "%")}");
      print("Umidade máxima anual: ${vermelho((umidadeMax * 100).toStringAsFixed(2) + "%")}");
      print("Umidade mínima anual: ${azul((umidadeMin * 100).toStringAsFixed(2) + "%")}");


    } else if (opc == 3) {
      print("Relatório vento $estado");

      Map<double, int> freqAnual = {};
      for (var d in dadoEstado) {
        freqAnual[d.dirVento] = (freqAnual[d.dirVento] ?? 0) + 1;
      }
      var dirMaisFreqAno = freqAnual.entries.reduce((a, b) => a.value > b.value ? a : b);
      print("Direção de vento mais frequente no ano: ${azul("${dirMaisFreqAno.key}º")}");

      print("\nDireção de vento mais frequente por mês:");
      var porMes = <int, List<Dados>>{};
      for (var d in dadoEstado) {
        porMes.putIfAbsent(d.dataHora.month, () => []).add(d);
      }

      var mesesOrdenados = porMes.keys.toList()..sort();
      for (var mes in mesesOrdenados) {
        var lista = porMes[mes]!;
        Map<double, int> freqMes = {};
        for (var d in lista) {
          freqMes[d.dirVento] = (freqMes[d.dirVento] ?? 0) + 1;
        }
        var dirMaisFreqMes = freqMes.entries.reduce((a, b) => a.value > b.value ? a : b);
        print(" - Mês $mes: ${amarelo(dirMaisFreqMes.key.toString() + "º") } | ${amarelo(ConversorAngulo.grausParaRadianos(dirMaisFreqMes.key).toStringAsFixed(2) + " Rad") } (${dirMaisFreqMes.value} ocorrências) ");
      }
    }
  }
}
