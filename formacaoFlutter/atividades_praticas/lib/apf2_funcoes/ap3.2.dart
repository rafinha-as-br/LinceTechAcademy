import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(ap32App());
}

class ap32App extends StatefulWidget {
  const ap32App({super.key});

  @override
  State<ap32App> createState() => _ap32AppState();
}

enum Formato { quadrado, circulo }

enum Cores { azul, branco, vermelho, verde, preto, amarelo }

class _ap32AppState extends State<ap32App> {
  //começa como quadrado por padrão
  String stringBotao = 'Mudar para círculo';
  Formato formatoAtual = Formato.quadrado;

  //começa como azul por padrão
  Cores corAtual = Cores.azul;
  Color cor = Colors.blue;


  //funções para os botões
  void mudarFormaGeometrica(Formato formaAtual) {
    setState(() {
      if (formaAtual == Formato.quadrado) {
        formatoAtual = Formato.circulo;
        stringBotao = 'Mudar para quadrado';
      } else {
        formatoAtual = Formato.quadrado;
        stringBotao = 'Mudar para círculo';
      }
    });
  }

  Cores mudarCor() {
    final random = Random();
    final cores = Cores.values;
    return cores[random.nextInt(cores.length)];
  }

  @override
  Widget build(BuildContext context) {
    //Switch case para definir cor
    switch (corAtual) {
      case Cores.azul:
        cor = Colors.blue;
        break;
      case Cores.amarelo:
        cor = Colors.yellow;
        break;
      case Cores.branco:
        cor = Colors.white;
        break;
      case Cores.preto:
        cor = Colors.black;
        break;
      case Cores.verde:
        cor = Colors.green;
        break;
      case Cores.vermelho:
        cor = Colors.red;
        break;
    }

    //switch case para construçao do formato geometrico
    Widget formaGeometrica;
    switch (formatoAtual) {
      case Formato.quadrado:
        formaGeometrica = Container(
          width: 100,
          height: 100,
          color: cor,
        );
        break;
      case Formato.circulo:
        formaGeometrica = Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(color: cor, shape: BoxShape.circle),
        );
        break;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      mudarFormaGeometrica(formatoAtual);
                    },
                    child: Text(
                      stringBotao,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                      onPressed: () {
                    setState(() {
                      corAtual = mudarCor();
                    });
                  },
                      child: Text(
                        'Mudar cor', style: TextStyle(color: Colors.white),
                      )
                  ),
                ],
              ),
              SizedBox(height: 10),
              formaGeometrica,
            ],
          ),
        ),
      ),
    );
  }
}
