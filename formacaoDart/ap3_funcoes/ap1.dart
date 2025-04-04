import 'dart:math';

//função que recebe a lista
void receberLista(List <int> listaRecebida){
  String stringImpessao = "";
  listaRecebida.forEach((element) => stringImpessao += " ${element.toString()};");
  print("Lista: ${stringImpessao == null ?? "Lista Vazia"}"); //imprime a lista e verifica se ela não está nula (caso esteja: imprime "lista Nula"
}

//função que recebe 2 listas
void receberLista2(List<int> lista01, List<int> lista02){
  List<int> lista03 = [0,0,0,0,0];

  for(int i=0; i<5; i++){
    print("${lista01[i]} + ${lista02[i]}");
    lista03[i] = lista01[i] + lista02[i];
  }

  receberLista(lista03);
}

void main(){

  //criação das 2 listas com valores aleatórios
  final List<int> lista1 = List.generate(5, (_) => Random().nextInt(10));
  final List<int> lista2 = List.generate(5, (_) => Random().nextInt(10));

  //chama função que imprime lista
  receberLista(lista1);
  receberLista(lista2);

  //chama função que soma 2 listas e imprime uma nova lista
  receberLista2(lista1, lista2);


}