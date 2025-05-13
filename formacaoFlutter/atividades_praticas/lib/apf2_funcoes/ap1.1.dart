import 'package:flutter/material.dart';

void main() {
  runApp(ap1App());
}

class ap1App extends StatelessWidget {
  const ap1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //3 quadrados de cima
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.green),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),

            //quadrado amarelo
            Container(width: 50, height: 50, color: Colors.yellow),

            //quadrado cinza
            Container(width: 50, height: 50, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
