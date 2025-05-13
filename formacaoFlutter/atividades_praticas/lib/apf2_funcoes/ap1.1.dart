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
        backgroundColor: Colors.black12,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //3 quadrados de cima
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                SizedBox(width: 8),
                Container(width: 50, height: 50, color: Colors.green),
                SizedBox(width: 8),
                Container(width: 50, height: 50, color: Colors.blue),
              ],
            ),
            SizedBox(height: 8),
            //quadrado amarelo
            Container(
              color: Colors.yellow,
              width: 200,
              height: 130,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // retângulo roxo 50x100
                      Container(width: 50, height: 100, color: Colors.purple),
                      SizedBox(width: 8),
                      // retângulo ciano 50x100s
                      Container(width: 50, height: 100, color: Colors.cyan),
                      SizedBox(width: 8),
                      //dois quadrados 50x50
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.purple,
                          ),
                          SizedBox(height: 8),
                          Container(width: 50, height: 50, color: Colors.cyan),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            //quadrado cinza
            Container(
              width: 80,
              height: 70,
              color: Colors.grey,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(color: Colors.black, width: 50, height: 50,)
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
