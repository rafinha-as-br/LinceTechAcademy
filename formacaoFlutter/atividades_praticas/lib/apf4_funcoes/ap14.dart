
import 'package:flutter/material.dart';

void main() {
  runApp(ap14App());
}

// -App começa no widget pai que tem a lista de cores
// - Tem uma função neste widget pai que é chamada como callBack no widget de lista,
// essa função verifica o texto do botão pressionado e muda para a tela
// com aquela cor (o widget vai ser construido com aquela cor passada na função)
// - Esse widget com a cor passada vai ter um botão para voltar para a tela anterior
// - Adicionar uma observação que eu fiz uma alteração e fiz com botões para
// testar passar informações para uma outra tela (parâmetros)

//lista de cores

class ap14App extends StatelessWidget {
  ap14App({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void mudarCorRotas(String cor) {
    navigatorKey.currentState?.pushNamed('/TelaCores', arguments: cor);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/TelaLista',
      routes: {
        '/TelaLista': (context) => TelaLista(mudarCor: mudarCorRotas),
        '/TelaCores': (context) => TelaCores(),
      },
    );
  }
}

class TelaLista extends StatelessWidget {
  TelaLista({super.key, required this.mudarCor});

  final List<String> cores = ['Azul', 'Vermelho', 'Verde', 'Amarelo', 'Branco'];
  final Function(String) mudarCor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cores.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: ()=> mudarCor(cores[index] ),
              child: Text(cores[index]),
            ),
          );
        },
      ),
    );
  }
}

class TelaCores extends StatelessWidget {
  const TelaCores({super.key});

  @override
  Widget build(BuildContext context) {
    final String corRecebida =
        ModalRoute.of(context)!.settings.arguments as String;
    //iniciando como cor branca por padrão
    Color corExibida = Colors.white;

    switch (corRecebida) {
      case 'Azul':
        corExibida = Colors.blue;
        break;
      case 'Vermelho':
        corExibida = Colors.red;
        break;
      case 'Verde':
        corExibida = Colors.green;
        break;
      case 'Amarelo':
        corExibida = Colors.yellow;
        break;
      case 'Branco':
        corExibida = Colors.white;
        break;
    }

    return Scaffold(
        backgroundColor: corExibida,
        appBar: AppBar(title: Text('Tela de cor: $corRecebida')),
        body: Center(),
      );

  }
}
