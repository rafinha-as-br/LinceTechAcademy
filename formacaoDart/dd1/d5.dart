import 'dart:math';

void main(){
  //lista de nomes
  List<String> nomes = ["Ana", "Francisco", "Joao", "Pedro", "Gabriel", "Rafaela", "Marcio", "Jose", "Carlos", "Patricia", "Helena", "Camila", "Mateus", "Gabriel", "Maria", "Samuel", "Karina", "Antonio", "Daniel", "Joel", "Cristiana", "Sebastião", "Paula"];
  //lista de sobrenomes
  List<String> sobrenomes = ["Silva", "Ferreira", "Almeida", "Azevedo", "Braga", "Barros", "Campos", "Cardoso", "Teixeira", "Costa", "Santos", "Rodrigues", "Souza", "Alves", "Pereira", "Lima", "Gomes", "Ribeiro", "Carvalho", "Lopes", "Barbosa"];

  //pegando números aleatórios
  int numeroAleatorio1 = Random().nextInt(nomes.length);
  int numeroAleatorio2 = Random().nextInt(sobrenomes.length);

  //gerando nome aleatório
  print("Nome: ${nomes[numeroAleatorio1]} ${sobrenomes[numeroAleatorio2]}");

}