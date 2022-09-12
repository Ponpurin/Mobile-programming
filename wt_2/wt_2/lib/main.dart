import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Dhanat Srihirun")),
        body: const Image(image: AssetImage('images/myself.jpg')),
      ),
    ),
  );
}
