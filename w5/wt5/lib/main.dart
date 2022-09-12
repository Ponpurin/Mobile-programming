import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('WT5')),
        body: const SafeArea(
          child: JankenPage(),
        ),
      ),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({
    Key? key,
  }) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  var jankenNumber1 = 1;
  var jankenNumber2 = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: IconButton(
              iconSize: 100,
              icon: Image(
                  image: AssetImage('images/Janken/janken$jankenNumber1.png')),
              onPressed: () {
                setState(() {
                  jankenNumber1 = Random().nextInt(3) + 1;
                });
                dev.log('bt 1 pressed');
              }),
        ),
        Expanded(
          child: IconButton(
              iconSize: 100,
              icon: Image(
                  image: AssetImage('images/Janken/janken$jankenNumber2.png')),
              onPressed: () {
                setState(() {
                  jankenNumber2 = Random().nextInt(3) + 1;
                });
                dev.log('bt 1 pressed');
              }),
        ),
      ],
    );
  }
}
