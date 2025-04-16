//classe retangulo
import 'dart:io';

class retangulo{
  final double largura;
  final double altura;

  retangulo({required this.altura, required this.largura});

  double calcularArea(){
    double area = altura * largura;
    return area;
  }

}

void main(){
  print("Informe a altura do retângulo: ");
  double A = double.tryParse(stdin.readLineSync()?? "")?? 0;
  print("Informe a largura do retângulo:");
  double B = double.tryParse(stdin.readLineSync()?? "")?? 0;

  //criando a instância e calculando a área
  retangulo retangulo1 = new retangulo(altura: A, largura: B);
  double area = retangulo1.calcularArea();
  print("A área do retângulo é: ${area.toStringAsFixed(2)}");

}