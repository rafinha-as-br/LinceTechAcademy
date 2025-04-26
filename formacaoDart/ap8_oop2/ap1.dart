import 'dart:math';

//enum com gêneros musicais
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

  //lista que recebe os generos musicais
  List<Enum> listaDeGeneros = [];
  listaDeGeneros.addAll(GenerosMusicais.values);
  print("Meu gênero musical preferido é: ${listaDeGeneros[numeroAleatorio].name}");


}