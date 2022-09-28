import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:freegame/Screens/data_screen.dart';
import 'package:freegame/componant/style.dart';

class GamelistScreen extends StatefulWidget {
  const GamelistScreen({Key? key}) : super(key: key);

  @override
  State<GamelistScreen> createState() => _GamelistScreenState();
}

class _GamelistScreenState extends State<GamelistScreen> {
  List gameList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    this._fetchGame();
  }

  _fetchGame() async {
    var url = 'https://www.freetogame.com/api/games?sort-by=alphabetical';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        gameList = items;
      });
    } else {
      gameList = [];
    }
  }

  Widget getCard(index) {
    int gameId = index['id'];
    var gameTitle = index['title'];
    var gameThumb = index['thumbnail'];
    var gameGenre = index['genre'];
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(image: NetworkImage(gameThumb))),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gameTitle,
                      style: myListTextStyle,
                    ),
                    Text(
                      gameGenre,
                      style: myListTextStyle,
                    )
                  ],
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DataScreen(id: gameId)));
          },
        ),
      ),
    );
  }

  Widget getBody() {
    return ListView.builder(
        itemCount: gameList.length,
        itemBuilder: ((context, index) {
          return getCard(gameList[index]);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text('Free Game List', style: myHeadTextStyle)),
        ),
        body: getBody());
  }
}
