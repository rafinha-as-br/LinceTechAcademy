import 'dart:math';

//calcular area
double calcularArea(double raio) {
  double area = pi * pow(raio, 2);
  return area;
}

//calcular perimetro
double calcularPerimetro(double raio){
  double perimetro = 2 * pi * raio;
  return perimetro;
}

void main(){
  //lista já forncecida
  List<double> raios = [5, 8, 12, 7.3, 18, 2, 25];
  //for each que percorre a lista e imprime já chamando as funções;
  raios.forEach((e){
    print("Raio: $e | Área: ${calcularArea(e).toStringAsFixed(2)} | Perímetro: ${calcularPerimetro(e).toStringAsFixed(2)}");
  });
}