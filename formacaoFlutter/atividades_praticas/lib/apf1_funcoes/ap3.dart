import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: MyWidget())),
    );
  }
}

enum estadoJogo{
  andamento,
  ganhou,
  perdeu
}


class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  estadoJogo estado = estadoJogo.andamento;

  final random = Random();

  var botaoCorreto = 0;
  var clicks = 0;
  var ganhou = false;
  var perdeu = false;

  void resetarJogo() {
    setState(() {
      ganhou = false;
      perdeu = false;
      clicks = 0;
      botaoCorreto = random.nextInt(3);
    });
  }

  // Esse metodo e chamado somente uma vez, ao iniciar o state
  @override
  void initState() {
    super.initState();

    // Escolher um número de 0 a 2 para identificar escolher o botão correto
    botaoCorreto = random.nextInt(3);
    print(botaoCorreto);
  }

  // Tratar a tentativa do usuário
  void tentativa(int opcao) {
    setState(() {
      // Verificar se a opção escolhida esta correta
      if (opcao == botaoCorreto) {
        estado = estadoJogo.ganhou;
      } else {
        // Se estiver errada, incrementa o contador de clicks
        clicks++;
      }

      // Se a quantidade de clicks for maior ou igual a 2, o usuário perdeu
      if (clicks >= 2 && !ganhou) {
        perdeu = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return switch(estado){
      estadoJogo.ganhou =>

    };



    /* Se o usuário ganhou, retorna a mensagem de sucesso com o fundo em verde
    if (ganhou) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: Colors.green, child: const Text('Você ganhou', style: TextStyle(fontSize: 20),)),
          ElevatedButton(
            onPressed: () => resetarJogo(),
            child: const Text('Resetar', style: TextStyle(fontSize: 20)),
          ),
        ],
      );
    }

    // Se o usuário perdeu, retorna a mensagem de fracasso com o fundo em vermelho
    if (perdeu) {
      return Container(
        color: Colors.red,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você perdeu', style: TextStyle(fontSize: 30)),
            // ******* 4. botão de resetar
            ElevatedButton(
              onPressed: () => resetarJogo(),
              child: const Text('Resetar', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      );
    }


     */

    /* Nesse momento o jogo ainda nao foi finalizado
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text('A'),
              onPressed: () {
                tentativa(0);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text('B'),
              onPressed: () {
                tentativa(1);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text('C'),
              onPressed: () {
                tentativa(2);
              },
            ),
          ],
        ),
      ],
    );
    */

  }
}


// *** Widget para cada situação de jogo ***

// widget para jogo em andamento
class Andamento extends StatelessWidget {
  const Andamento(this.tentativa);

  final void Function(int) tentativa;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text('A'),
              onPressed: () {
                tentativa(0);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text('B'),
              onPressed: () {
                tentativa(1);
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text('C'),
              onPressed: () {
                tentativa(2);
              },
            ),
          ],
        ),
      ],
    );
  }
}

//widget para derrota
class Derrota extends StatelessWidget {
  const Derrota(this.resetarJogo);

  final void Function() resetarJogo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(color: Colors.green, child: const Text('Você ganhou', style: TextStyle(fontSize: 20),)),
        ElevatedButton(
          onPressed: () => resetarJogo(),
          child: const Text('Resetar', style: TextStyle(fontSize: 20)),
        ),
      ],
    );  }
}

