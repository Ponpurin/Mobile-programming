import 'package:flutter/material.dart';

class Searchcreens extends StatefulWidget {
  const Searchcreens({Key? key}) : super(key: key);

  @override
  State<Searchcreens> createState() => _SearchcreensState();
}

class _SearchcreensState extends State<Searchcreens> {
  String? idNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Game'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Game ID',
                ),
                onChanged: (value) {
                  idNumber = value;
                }),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context, idNumber);
              },
              child: const Text('Search'))
        ],
      ),
    );
  }
}
