import 'package:flutter/material.dart';

void main() {
  runApp(ap14App());
}

//lista de cores


class ap14App extends StatelessWidget {
  const ap14App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }
}

class telaLista extends StatelessWidget {
  const telaLista({super.key});
  final List<String> cores = ['Azul', 'Vermelho', 'Verde', 'Amarelo', 'Branco'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      body: ListView(
        ListView.builder(itemBuilder: itemBuilder)
      ),
    ),);
  }
}



