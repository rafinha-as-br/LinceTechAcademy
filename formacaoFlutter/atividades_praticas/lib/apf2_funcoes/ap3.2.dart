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


class _ap32AppState extends State<ap32App> {

  String stringBotao = 'Mudar para círculo';
  Formato formatoAtual = Formato.quadrado;

  void mudarFormaGeometrica(Formato formaAtual){
    setState(() {
      if(formaAtual == Formato.quadrado){
        formatoAtual = Formato.circulo;
        stringBotao = 'Mudar para quadrado';
      } else{
        formatoAtual = Formato.quadrado;
        stringBotao = 'Mudar para círculo';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    //switch case para construçao do formato geometrico
    Widget formaGeometrica;

    switch (formatoAtual) {
      case Formato.quadrado:
        formaGeometrica = Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        );
        break;
      case Formato.circulo:
        formaGeometrica = Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        );
        break;
    }



    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  ElevatedButton(onPressed: () {
                    mudarFormaGeometrica(formatoAtual);
                  }, child: Text(stringBotao)),
                  //ElevatedButton(onPressed: onPressed, child: child),
                ],
              ),
              formaGeometrica,
            ],
          ),
        ),
      ),
    );
  }
}




