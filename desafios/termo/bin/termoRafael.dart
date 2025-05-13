import 'dart:io';
import 'package:termo/dicionario.dart';
import 'package:termo/terminal_utils.dart';

//função obter palavra do usuário
String obterPalavra(){
  List <String> letrasUser =[];

  //loop que percorre a lista preenchendo com as letras
  for(int i=0; i<5; i++){
    print("Letra ${i+1} : ");
    letrasUser.add(stdin.readLineSync() ?? "");
}

  //junta a lista em uma String
  String palavraDoUser = letrasUser.join('');

  return palavraDoUser;

}

//função que verifica se a palavra está correta
bool verificadorDePalavras(String palavraSorteada, String palavraDoUser){

  //dar um split na palavra sorteada
  List <String> letrasPalavraSorteada = palavraSorteada.split('');
  // dar um split na palavra do user
  List <String> letrasPalavraUser = palavraDoUser.split('');
  // Lista que contem a quantidade de letras
  List <int> numerosLetras = [0,0,0,0,0];

  // [1,1,3,0,0]
  // [1,-, -, +, +]
  // [0,0,1,1,0]

  // [p,a,s,s,o] palavra original
  // [b,a,s,t,a]

  //numerando a quantidade de letras
  for(int i=0; i<5; i++){
    numerosLetras[i]++;
    for(int j=i; j<5; j++){
      if(letrasPalavraSorteada[j] == letrasPalavraSorteada[i] && j != i){
        numerosLetras[i]++;
      }
    }
  }

  //achando o indice da letra na lista de números
  int acharIndice(String letra){
    int indice=0;
    for(int i=0; i<5; i++){
      if(letra == letrasPalavraSorteada[i]){
        indice = i;
      }
    }
    return indice;
  }

  String respostaComparada = "";
  // verificar letra a letra e printar colorido o que está correto ou incorreto
  for (int i=0; i<5; i++){
    //verificadores de letra a letra
    if(letrasPalavraUser[i] == letrasPalavraSorteada[i]){
      respostaComparada += "${colorizeGreen(letrasPalavraUser[i])}";
      numerosLetras[i]--;
    } else if(letrasPalavraSorteada.contains(letrasPalavraUser[i])){
      //verificar quantos tem, procurando o indice da letra, usar o indice para verificar se tem letras sobrando
      int indice = acharIndice(letrasPalavraUser[i]);
      if(numerosLetras[indice] > 0){
        respostaComparada += "${colorizeYellow(letrasPalavraUser[i])}";
        numerosLetras[i]--;
      } else{
        respostaComparada += "${colorizeRed(letrasPalavraUser[i])}";
      }
    } else{
      respostaComparada += "${colorizeRed(letrasPalavraUser[i])}";
    }
  }
  //imprime a resposta comparada
  print("$respostaComparada");

  // verifica se as palavras estão iguais (retornando true o false)
  bool resposta = false;
  if(palavraDoUser == palavraSorteada){
    resposta = true;
  }
  return resposta;

}



void main(){
  // pegar a palavra sorteada
  final palavraSorteada = sortearPalavra();

  //loop de obter dado usuário e verificar
  int i=0;
  bool resposta = false;

  while (i<6){
    print("tentativa ${i+1}");
    String palavraUser = obterPalavra();
    resposta = verificadorDePalavras(palavraSorteada, palavraUser);
    if(resposta == true){
      print("Meus parabéns! Você acertou o termo do dia! O termo de hoje era: $palavraSorteada!");
      i=6;
    }
    i++;
  }
  if(resposta==false){
    print("Que pena! Você alcançou o limite de tentativas! A palavra de hoje era: $palavraSorteada");
  }

}