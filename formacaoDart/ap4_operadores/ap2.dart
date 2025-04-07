//função

/*String? verificador1(List<String> listaOriginal){

  List <String> listaNova = [];
  for(int i=0; i<10; i++){
    String objeto = listaOriginal[i].toString(listaOriginal[i].split(''));
  }
} */

//função de trasnformar para inteiro ? caso contrário ele coloca zero

import 'dart:ffi';

void main(){
  //criando a lista com os valores fornecidos
  List <String> listaOriginal = ["10", "2XXL7", "JOJ0", "99", "381", "AD44", "47", "2B", "123", "78"];
  List <int> listaConvertida = [];

  String listaConvertidaS = "";
  for (int i=0; i<10; i++){
    listaConvertida.add(int.tryParse(listaOriginal[i])?? 0);
    listaConvertidaS += "${listaConvertida[i]}, ";
  }
  print("Lista convertida: $listaConvertidaS");




}