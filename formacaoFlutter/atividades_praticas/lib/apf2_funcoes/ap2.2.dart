import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ap22App());
}

class ap22App extends StatefulWidget {
  const ap22App({super.key});

  @override
  State<ap22App> createState() => _ap22AppState();
}

class _ap22AppState extends State<ap22App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white10,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.grey,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                      top: 10,
                      left: 10,
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                      ),
                      top: 20,
                      left: 20,
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                      top: 30,
                      left: 30,
                    ),

                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.black,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                      top: 10,
                      left: 10,
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.purple,
                      ),
                      top: 20,
                      left: 20,
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.yellow,
                      ),
                      top: 30,
                      left: 30,
                    ),

                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                      top: 10,
                      left: 10,
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.yellow,
                      ),
                      top: 20,
                      left: 20,
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      ),
                      top: 30,
                      left: 30,
                    ),

                  ],
                ),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.deepPurple,
                      ),
                      top: 10,
                      left: 10,
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                      top: 20,
                      left: 20,
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.yellow,
                      ),
                      top: 30,
                      left: 30,
                    ),
                    Positioned(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                      ),
                      top: 40,
                      left: 40,
                    ),

                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
