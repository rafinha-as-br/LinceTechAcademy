//função para converter de decimal para binário
import 'dart:math';

String? converterDB(int numero){
  String numeroBinario = "";
  while(numero>0){
    numeroBinario += "${numero % 2}";
    numero = numero~/2;
  }

  numeroBinario = numeroBinario.split('').reversed.join();
  return "Binário: $numeroBinario";

}

//função para converter de decimal para octal
String? converterDO(int numero){
  String numeroOctal= "";
  while(numero>0){
    numeroOctal += "${numero%8}";
    numero = numero~/8;
  }

  numeroOctal = numeroOctal.split('').reversed.join();
  return "Octal: $numeroOctal";

}

//função para converter de decimal para hexadecimal
String? converterDH(int numero){
  String numeroHexa = "";
  const hexChars = '0123456789ABCDEF';

  while(numero>0) {
    numeroHexa += "${hexChars[numero % 16]}";
    numero = numero ~/ 16;
  }
  numeroHexa = numeroHexa.split('').reversed.join();
  return "Hexadecimal: $numeroHexa";

}

void main(){
  List<int> listaDecimais = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];
  for(int i=0; i<11; i++){
    print("Decimal: ${listaDecimais[i]}, ${converterDB(listaDecimais[i])}, ${converterDO(listaDecimais[i])}, ${converterDH(listaDecimais[i])}");
  }
}