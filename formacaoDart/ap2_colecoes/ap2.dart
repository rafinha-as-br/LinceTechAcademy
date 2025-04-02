import 'dart:math';

void main(){
  //cria a lista dinâmica
  List<int> lista = [];

  //preenche essa lista e já salva na variável de controle para impressão
  String listaOriginal = "";
  for(int i=0; i<50; i++){
    lista.add(Random().nextInt(15));
    listaOriginal += " ${lista[i].toString()};";
  }

  //imprime a lista original usando a variável usada durante o loop de preenchimento
  print("Lista original: ");
  print("$listaOriginal");

  //realiza a remoção dos números pares
  lista.removeWhere((item)=> item%2 == 0);

  //imprime a lista atualizada
  String novaLista = " ";
  print("Lista atualizada: ");
  lista.forEach((item) => novaLista += " ${item.toString()};");
  print(novaLista);
}
