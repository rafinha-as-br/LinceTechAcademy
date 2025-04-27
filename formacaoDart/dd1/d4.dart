import 'dart:io';

//função quee retorna um dateTime com a novaData
DateTime somador18Dias(DateTime data){
  DateTime novaData = data;
  int somador =18;
  while(somador>0){
    novaData = novaData.add(Duration(days: 1));
    if(novaData.weekday >=1 && novaData.weekday <=5){
      somador--;
    }

  }
  return novaData;
}

void main(){
  //obtendo as datas
  print("Informe o dia: ");
  int dia = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  print("Informe o mês: ");
  int mes = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  print("Informe o ano: ");
  int ano = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  //chamar a função
  DateTime dataAtual = DateTime(ano, mes, dia);

  //printar a data atual e calculada
  DateTime novaData = somador18Dias(dataAtual);
  print("Data atual é: ${dataAtual.day}/${dataAtual.month}/${dataAtual.year}");
  print("A data calculada é: ${novaData.day}/${novaData.month}/${novaData.year}");

}