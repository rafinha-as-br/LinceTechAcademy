//interface Forma
import 'dart:math';

abstract class forma{
  void calcularArea(){}
}

class Retangulo implements forma{
  final double base;
  final double altura;

  Retangulo(this.base, this.altura){
    if(base<=0 || altura <=0 ){
      throw Exception("Dimensões inválidas, informe apenas valores positivos maiores que zero");
    }
  }
  @override
  double calcularArea() {
    return base * altura;
  }

}

void main(){
  final random = Random();
  try{
    final retangulo = Retangulo(random.nextDouble()*99, random.nextDouble()*99);
    double area = retangulo.calcularArea();
    print("A area do triangulo eh: ${area.toStringAsFixed(2)}");
  } on Exception catch (e){
    print(e);
  }

}