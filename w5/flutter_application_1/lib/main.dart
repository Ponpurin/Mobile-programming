import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: const Text('W5'),
        ),
        body: const SafeArea(
          child: DicePage(),
        ),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var diceNumber_1 = 1;
  var diceNumber_2 = 1;
  var diceNumber_3 = 1;
  var diceNumber_4 = 1;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: IconButton(
                iconSize: 200,
                onPressed: () {
                  setState(() {
                    diceNumber_1 = Random().nextInt(6) + 1;
                  });
                  dev.log('Dice 1 got pressed.');
                },
                icon: Image(
                  image: AssetImage('images/Dices/dice$diceNumber_1.png'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: IconButton(
                iconSize: 200,
                onPressed: () {
                  setState(() {
                    diceNumber_2 = Random().nextInt(6) + 1;
                  });
                  dev.log('Dice 2 got pressed.');
                },
                icon: Image(
                  image: AssetImage('images/Dices/dice$diceNumber_2.png'),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: IconButton(
                iconSize: 200,
                onPressed: () {
                  setState(() {
                    diceNumber_3 = Random().nextInt(6) + 1;
                  });
                  dev.log('Dice 3 got pressed.');
                },
                icon: Image(
                  image: AssetImage('images/Dices/dice$diceNumber_3.png'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: IconButton(
                iconSize: 200,
                onPressed: () {
                  setState(() {
                    diceNumber_4 = Random().nextInt(6) + 1;
                  });
                  dev.log('Dice 4 got pressed.');
                },
                icon: Image(
                  image: AssetImage('images/Dices/dice$diceNumber_4.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
