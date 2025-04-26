import 'dart:math';

//enum com gêneros musicais
import 'dart:math';

enum GenerosMusicais{
  sertanejo,
  rock,
  popRock,
  gospel,
  funk,
  metal,
}

void main(){

  //Randomizador de generos musicais
  int numeroAleatorio = Random().nextInt(6);
  List<Enum> listaDeGeneros = [];

  for(int i=0; i<6; i++){
    listaDeGeneros.addAll(GenerosMusicais.values);
  }

  print("Meu gênero musical preferido é: ${listaDeGeneros[numeroAleatorio]}");


}