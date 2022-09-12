import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Hello")),
      body: const Image(image: AssetImage('images/Billy_shy.png')),
    ),
  ));
}
