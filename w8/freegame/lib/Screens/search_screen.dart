import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? idNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Game Search'),
      ),
      body: Row(children: [
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
      ]),
    );
  }
}
