import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(ap2App());
}

class ap2App extends StatefulWidget {
  const ap2App({super.key});

  @override
  State<ap2App> createState() => _ap2AppState();
}

class _ap2AppState extends State<ap2App> {
  var color = Colors.grey;
  int tentativas = 2;
  String stringTentativas = "Tentativas:";
  int escolhaAleatoria = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    //verificador de botões
    void verificadorBotao(int i) {
      setState(() {
        if (tentativas != 0) {
          if (i == escolhaAleatoria) {
            color = Colors.green;
            stringTentativas = "Parabéns você acertou!";
            tentativas = 0;
          } else if (i != escolhaAleatoria) {
            color = Colors.red;
            tentativas--;
            if (tentativas == 0) {
              stringTentativas =
                  "Você não tem mais tentativas, pressione resetar";
            } else {
              stringTentativas = "Tentativas $tentativas";
            }
          }
        } else {
          stringTentativas = "Você não tem mais tentativas, pressione resetar";
        }
      });
    }

    void resetadorBotao() {
      setState(() {
        tentativas = 2;
        stringTentativas = "Tentativas $tentativas";
        color = Colors.grey;
        escolhaAleatoria = Random().nextInt(3);
      });
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: color,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                      ),
                      onPressed: () {
                        verificadorBotao(0);
                      },
                      child: Text(
                        'A',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                      ),
                      onPressed: () {
                        verificadorBotao(1);
                      },
                      child: Text(
                        'B',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                      ),
                      onPressed: () {
                        verificadorBotao(2);
                      },
                      child: Text(
                        'C',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  ),
                  onPressed: () {
                    resetadorBotao();
                  },
                  child: Text(
                    'Resetar',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    "$stringTentativas",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
