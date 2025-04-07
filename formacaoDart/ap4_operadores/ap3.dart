import 'dart:io';

List <int> modificadorDeLista (List<int> listaRecebida, int parametro){
  listaRecebida.removeAt(parametro);
  return listaRecebida;
}

void main(){
  //criação da lista primária informada pelo usuário
  List<int> lista = [];

  print("Informe quantos elementos haverá na lista original: ");
  int num1 = int.tryParse(stdin.readLineSync() ?? "") ?? 1;

  print("Preenchendo a lista...\n");
  for(int i=0; i<num1; i++){
    print("Posição $i: ");
    lista.add(int.tryParse(stdin.readLineSync()?? "")?? 0); //tratamento caso venha algum valor que não seja int
  }

  print("Lista preenchida! Informe um índice para remover da lista...");
  int num2 = int.tryParse(stdin.readLineSync()?? "")?? 0; //tratamento igual ao anterior
  print("Removendo item $num da lista...");

  List <int> listaModificada = modificadorDeLista(lista, num2);
  print("Item $num removido!");
  String listaS = "";
  for(int i=0; i<listaModificada.length; i++){
    listaS += "${listaModificada[i]},";
  }
  print("\nImprimindo a lista atualizada: $listaModificada");

}