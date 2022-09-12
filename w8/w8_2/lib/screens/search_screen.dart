import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Report'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter city name',
            ),
            onChanged: (value) {
              cityName = value;
            },
          )),
          TextButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              child: const Text('Search'))
        ],
      ),
    );
  }
}
