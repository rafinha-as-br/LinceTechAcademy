void main(){
  //lista de números informados
  List <int> numeros = [10, 35, 999, 126, 95, 7, 348, 462, 43, 109];
  int somadorFor =0;
  int somadorWhile =0;
  int j=0;

  for(int i=0; i<10; i++){
    somadorFor += numeros[i];
  }
  print("For: $somadorFor");

  while(j<10){
    somadorWhile += numeros[j];
    j++;
  }
  print("While: $somadorWhile");

  int somadorRecursivo(List<int> listaDeNumeros){
    if(listaDeNumeros.isEmpty){
      return 0;
    } else{
      return listaDeNumeros.first + somadorRecursivo(listaDeNumeros.sublist(1));
    }
  }
  print("Recursão: ${somadorRecursivo(numeros)}");

  int somarLista(List<int> lista) {
    return lista.reduce((value, element) => value + element);
  }
  print("Lista: ${somarLista(numeros)}");

}