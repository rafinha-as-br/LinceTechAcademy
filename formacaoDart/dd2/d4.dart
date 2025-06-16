import 'dart:math' as math;

import '../ap6_erros/ap3.dart';

void main() {
  // Definindo o comparador de formas
  final comparador = ComparadorFormasGeometricas();

  /* Definindo as formas geometricas
  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);
  final retanguloA = Retangulo('Retângulo A', 4, 3);
  final retanguloB = Retangulo('Retângulo B', 19, 11);


  final circuloMaiorArea = comparador.circuloDeMaiorArea(circuloA, circuloB);
  final retanguloMaiorArea = comparador.retanguloDeMaiorArea(
    retanguloA,
    retanguloB,
  );

  if (circuloMaiorArea.area > retanguloMaiorArea.area) {
    print(
      'A maior area e ${circuloMaiorArea.area.toStringAsFixed(2)} '
          'e pertence a ${circuloMaiorArea.nome}',
    );
  } else {
    print(
      'A maior area e ${retanguloMaiorArea.area.toStringAsFixed(2)} '
          'e pertence a ${retanguloMaiorArea.nome}',
    );
  }

  final circuloaiorPerimetro = comparador.circuloDeMaiorPerimetro(
    circuloA,
    circuloB,
  );
  final retanguloMaiorPerimetro = comparador.retanguloDeMaiorPerimetro(
    retanguloA,
    retanguloB,
  );
  if (circuloaiorPerimetro.area > retanguloMaiorPerimetro.area) {
    print(
      'O maior perímetro e ${circuloaiorPerimetro.perimetro.toStringAsFixed(2)} '
          'e pertence a ${circuloaiorPerimetro.nome}',
    );
  } else {
    print(
      'O maior perímetro e ${retanguloMaiorPerimetro.perimetro.toStringAsFixed(2)} '
          'e pertence a ${retanguloMaiorPerimetro.nome}',
    );
  }

   */
}

//classe principal que as formas geométricas vão herdar dela
class FormaGeometrica {
  final String nome;
  final double area;
  final double perimetro;

  FormaGeometrica(
      {required this.nome, required this.area, required this.perimetro});

}

/// Representa a forma geometrica "círculo"
class Circulo extends FormaGeometrica {
  /// Construtor padrao, recebe o [raio] do círculo.

  final double raio;


  Circulo._(this.raio, double area, double perimetro)
      : super(
      nome: 'Circulo',
      area: area,
      perimetro: perimetro
  );

  factory Circulo(double raio){
    //calcular area do circulo
    final area = math.pi * math.pow(raio, 2);

    //calcular perimetro circulo
    final perimetro = 2 * math.pi * raio;

    return Circulo._(raio, area, perimetro);
  }


}

/// Representa a forma geometrica "retângulo", forma geometrica de quatro lados
/// e angulos retos (90 graus).
class Retangulo extends FormaGeometrica {
  /// Construtor padrao, recebe a [altura] e [largura] do retângulo
  factory Retangulo(double altura, double largura){
    //calcular area do retangulo
    double area = altura * largura;

    //calcular perimetro do retangulo
    double perimetro = (altura * 2) + (largura * 2);
    return Retangulo._(altura, largura, area, perimetro);
  }

  Retangulo._(this.altura,
      this.largura,
      double area,
      double perimetro)
      : super(
      nome: 'Retângulo',
      area: area,
      perimetro: perimetro
  );

  final double largura;
  final double altura;


}

/// Representa a forma geometrica "quadrado", que e um formato especial de
/// retângulo, onde todos os lados possuem o mesmo tamanho.
class Quadrado extends FormaGeometrica {
  /// Construtor padrao, recebe o [lado] do quadrado
  factory Quadrado(double lado){

    /// Retorna a area desse quadrado
    double area = lado * lado;

    /// Retorna o perímetro desse quadrado
    double perimetro = lado * 4;

    return Quadrado._(lado, area, perimetro);
  }

  Quadrado._(this.lado, double area, double perimetro)
      : super(nome: 'Quadrado', area: area, perimetro: perimetro);

  final double lado;
}

//**
//Representador da forma geométrica Triângulo equilátero
class TrianguloEquilatero extends FormaGeometrica {
  final double lados;

  factory TrianguloEquilatero(double lados){
    // *pegar a área do triângulo equilátero
    double area = 0.433 * math.pow(lados, 2);

    // *pegar o perímetro do triângulo equilátero
    double perimetro = lados * 3;

    return TrianguloEquilatero._(lados, area, perimetro);
  }

  TrianguloEquilatero._(this.lados,
      double area,
      double perimetro)
      : super(
      nome: 'Triângulo Equilátero',
      area: area,
      perimetro: perimetro
  );


}

// Represenador da forma geométrica do triângulo retângulo
class TrianguloRetangulo extends FormaGeometrica {
  final double base;
  final double altura;
  final double hip;

  factory TrianguloRetangulo(double base, double altura, double hip){
    // *Pegar a área de triângulo retângulo
    double area = (base * altura) / 2;

    // *pegar o perímetro do triângulo retângulo
    double perimetro = base + altura + hip;

    return TrianguloRetangulo._(base, altura, hip, area, perimetro);
  }

  TrianguloRetangulo._(this.base,
      this.altura,
      this.hip,
      double area,
      double perimetro)
      : super(
      nome: 'Triangulo retângulo',
      area: area,
      perimetro: perimetro

  );


}

//Representador da forma gemétrica Pentágono
class Pentagono extends FormaGeometrica {
  final double lados;

  factory Pentagono(double lados){
    // pegar o apotema para calcular a área do pentágono
    double apotema = lados / (2 * math.tan(math.pi / 5));

    // *pegar a área do pentágono
    double area = (5 / 2) * lados * apotema;

    // *pegar o perímetro do pentágono
    double perimetro = lados * 5;

    return Pentagono._(lados, area, perimetro);
  }


  Pentagono._(this.lados,
      double area,
      double perimetro) : super(
      nome: 'Pentagono',
      area: area,
      perimetro: perimetro

  );


}

// representador da forma geométrica hexágono
class Hexagono extends FormaGeometrica {
  final double lados;

  factory Hexagono (double lados){
    // *pegar o apótema para calcular a área;
    double apotema = (lados * math.sqrt(3) / 2);

    //calcular a área do hexágono
    double area = (3 * math.sqrt(3) / 2) * math.pow(lados, 2);

    // calcular perímetro do hexágono
    double perimetro = lados * 6;

    return Hexagono._(lados, area, perimetro);
  }

  Hexagono._(this.lados,
      double area,
      double perimetro)
      : super(
    nome: 'Hexagono',
    area: area,
    perimetro: perimetro,
  );


}

/// Compara caracteristicas de formas geometricas
class ComparadorFormasGeometricas {


  // *metodo comparar áreas
  FormaGeometrica maiorArea(List<FormaGeometrica> listaDasFormasGeometricas) {
    return listaDasFormasGeometricas.reduce((formaAtual, formaProxima){
      return formaAtual.area>formaProxima.area ? formaAtual : formaProxima;
    });
  }

  // *metodo comparar áreas
  FormaGeometrica maiorPerimetro(List<FormaGeometrica> listaDasFormasGeometricas) {
    return listaDasFormasGeometricas.reduce((formaAtual, formaProxima){
      return formaAtual.perimetro>formaProxima.perimetro ? formaAtual : formaProxima;
    });
  }



}


