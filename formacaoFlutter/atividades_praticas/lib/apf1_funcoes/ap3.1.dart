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

// *** 1. Enumerador para cada situação do jogo ***
enum estadoJogo { andamento, ganhou, perdeu }

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  estadoJogo estado = estadoJogo.andamento;

  final random = Random();

  var botaoCorreto = 0;
  var clicks = 0;
  int vitorias = 0;
  int derrotas = 0;

  void resetarJogo() {
    setState(() {
      clicks = 0;
      botaoCorreto = random.nextInt(3);
      estado = estadoJogo.andamento;
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
        vitorias++;
      } else {
        // Se estiver errada, incrementa o contador de clicks
        clicks++;
      }

      // Se a quantidade de clicks for maior ou igual a 2, o usuário perdeu
      if (clicks >= 2 && estado != estadoJogo.ganhou) {
        estado = estadoJogo.perdeu;
        derrotas++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // *** 3. Switch case com o enum ***
    return switch (estado) {
      estadoJogo.ganhou => Vitoria(resetarJogo),
      estadoJogo.perdeu => Derrota(resetarJogo),
      estadoJogo.andamento => Andamento(tentativa, vitorias, derrotas),
    };
  }
}

// *** 2. Widget para cada situação de jogo ***

// widget para jogo em andamento
class Andamento extends StatelessWidget {
  const Andamento(this.tentativa, this.vitorias, this.derrotas);

  final int vitorias;
  final int derrotas;
  final void Function(int) tentativa;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // *** 5. Contador de vitórias e derrotas ***
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Vitórias: $vitorias', style: TextStyle(fontSize: 30)),
            Text("Derrotas: $derrotas", style: TextStyle(fontSize: 30)),
          ],
        ),
        SizedBox(height: 30,),
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

//widget para Vitoria
class Vitoria extends StatelessWidget {
  const Vitoria(this.resetarJogo);

  final void Function() resetarJogo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.green,
          child: const Text('Você ganhou', style: TextStyle(fontSize: 20)),
        ),
        ElevatedButton(
          onPressed: () => resetarJogo(),
          child: const Text('Resetar', style: TextStyle(fontSize: 20)),
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
    return Container(
      color: Colors.red,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Você perdeu', style: TextStyle(fontSize: 30)),
          // *** 4. botão de resetar ***
          ElevatedButton(
            onPressed: () => resetarJogo(),
            child: const Text('Resetar', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
