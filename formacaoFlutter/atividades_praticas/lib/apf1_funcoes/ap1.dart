import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  var color = Colors.black;
  var random = Random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'Primeira atividade flutter!',
                style: TextStyle(fontSize: 24, color: color),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  switch (random.nextInt(5)){
                    case 1:
                      color = Colors.yellow;
                      break;
                    case 2:
                      color = Colors.blue;
                      break;
                    case 3:
                      color = Colors.orange;
                      break;
                    case 4:
                      color = Colors.red;
                      break;
                    case 5:
                      color = Colors.green;
                      break;

                  }
                });
              },
              child: Text("Mudar de cor!"),
            ),
          ],
        ),
      ),
    );
  }
}
