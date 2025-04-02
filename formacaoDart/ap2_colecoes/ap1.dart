import 'dart:math';

void main(){
  //cria a lista dinâmica
  List<int> lista = [];
  //preenche essa lista
  for(int i=0; i<10; i++){
    lista.add( Random().nextInt(100));
  }

  //imprime essa lista
  print("Imprimindo a lista com os números aleatórios...\n");
  for(int i=0; i<10; i++){
    print("Posição: $i, valor: ${lista[i]}\n");
  }
}