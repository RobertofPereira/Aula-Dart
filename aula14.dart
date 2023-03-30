// macoratii: https://www.macoratti.net/19/06/flut_snakb1.htm

///////////////////////////////////////////// main.dart //////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:random/random.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyRandom(),
    );
  }
}

/////////////////////////////////// (new file) lib > random.dart /////////////////////////////////////////
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyRandom extends StatefulWidget {
  const MyRandom({super.key});

  @override
  State<MyRandom> createState() => _MyRandomState();
}

class _MyRandomState extends State<MyRandom> {
  List<String> frases = [
    "I ❤ MILFS",
    "I ❤ DILFS",
    "Eu quero um sugar daddy",
    "Eu amo dinheiro"
    "💸💸💸💸💸"
  ];

  String _mostraMensagem() {
    var numAleatorio = Random().nextInt(frases.length);
    return frases[numAleatorio];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBar"),
        actions: [
          IconButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_mostraMensagem()),
                  dismissDirection: DismissDirection.horizontal,
                  action: SnackBarAction(
                    label: "Hmmm, é mesmo?",
                    onPressed: (){}
                  )
                ),
              );
            },
            icon: Icon(
              Icons.flutter_dash,
              size: 40,
            )
          )
        ],
      ),
    );
  }
}
