/*
texto do parágrafo : ok
numeros de palavras : usar o .split e .length
tamanho do texto : usar .length
numero de frases : usar split dividindo em .
numero total de vogais : tacar um switch case com cada vogal e percorrer a string completa adicionando o incrementador,
Consoantes encontradas : incrementador no else do switch case
*/

//metodo para calcular vogais e consoantes
List<String> calcularVE(String paragrafo){
  //pegando a string sem espacos e retirando a pontuação
  String paragrafoSemEspaco = paragrafo.replaceAll(' ', '');
  paragrafoSemEspaco = paragrafoSemEspaco.replaceAll('.', '');
  paragrafoSemEspaco = paragrafoSemEspaco.replaceAll(',', '');

  int vogais=0;

  List<String> consoantesVogaisStrings = ['',''];

  //percorrendo a string sem espaco
  for(int i=0; i<paragrafoSemEspaco.length; i++){

    switch(paragrafoSemEspaco[i]){
      case 'a':
        vogais++;
      case 'e':
        vogais++;
      case 'i':
        vogais++;
      case 'o':
        vogais++;
      case 'u':
        vogais++;
      default:
        consoantesVogaisStrings[1] += "${paragrafoSemEspaco[i]},";
    }

    consoantesVogaisStrings[0] = vogais.toString();
  }

  return consoantesVogaisStrings;

}


void main(){
  //parágrafo informado
  String paragrafo = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor";

  // imprimir texto do parágrafo
  print(paragrafo);

  //numero de palavras
  List<String> palavras = paragrafo.split(' ');
  print("Número de palavras: ${palavras.length}");
  //tamanho do texto:
  print("Tamanho do texto: ${paragrafo.length}");

  //numero de frases:
  List<String> frases = paragrafo.split('.');
  print("Número de frases: ${frases.length}");

  //numero total de vogais:
  List<String> listasVCstring = calcularVE(paragrafo);
  int totalVogais = int.tryParse(listasVCstring[0]) ?? 0;
  print("Número de vogais: $totalVogais");
  
  //Consoantes encontradas:
  List<String> consoantesEncontradasList = listasVCstring[1].split(',');
  //colocando dentro de uma string para facilitar a impressão
  String consoantesAchadas = consoantesEncontradasList.toSet().toString();
  print("Consoantes encontradas: $consoantesAchadas");

}