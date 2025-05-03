import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void mudarCor(){

    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:  Text(
            'Primeira atividade de Flutter!',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}

