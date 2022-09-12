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
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('HelloWorld'),
        ),
        body: Row(
          children: const <Widget>[
            Expanded(
              child: Image(
                image: AssetImage('images/dice1.png'),
              ),
            ),
            Expanded(
              child: Image(
                image: AssetImage('images/dice2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
