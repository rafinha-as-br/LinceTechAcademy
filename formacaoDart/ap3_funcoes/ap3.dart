
import 'dart:math';
//função de calcular área
double calcularArea(double raio){
  //fórmula para calcular área: A = A=π⋅r

  double area = pi * pow(raio, 2);
  return area;
}
//função de calcular perímetro
double calucularPerimetro(double raio){
  //fórmula para calcular perimetro: P=2⋅π⋅r

  double perimetro = 2 * pi * raio;
  return perimetro;
}
void main(){
  //cria a lista com 10 números aleatórios
  List<double> listaRaios = List.generate(10, (_) => Random().nextDouble()*100);

  //loop de impressão
  for(int i=0; i<10; i++){
    print("Raio: ${listaRaios[i].toStringAsFixed(2)}, Área: ${calcularArea(listaRaios[i]).toStringAsFixed(2)}, Perímetro: ${calucularPerimetro(listaRaios[i]).toStringAsFixed(2)}");
  }

}