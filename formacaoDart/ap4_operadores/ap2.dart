
void main(){
  //criando a lista com os valores fornecidos
  List <String> listaOriginal = ["10", "2XXL7", "JOJ0", "99", "381", "AD44", "47", "2B", "123", "78"];
  //cria a lista que terá os valores convertidos
  List <int> listaConvertida = [];

  String listaConvertidaS = "";
  for (int i=0; i<10; i++){
    listaConvertida.add(int.tryParse(listaOriginal[i])?? 0); //tenta converter pra int e caso não consiga, coloca como valor zero
    listaConvertidaS += "${listaConvertida[i]}, ";
  }

  //imprime lista
  print("Lista convertida: $listaConvertidaS");




}