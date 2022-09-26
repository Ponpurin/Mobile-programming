import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:freegame/api/freegame_api.dart';
import 'package:freegame/data/freegame_data/freegame_data.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:freegame/Screens/search_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<FreegameData>? freegameData;
  String? idNumber;

  List gameList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    this.fetchGame();

    //freegameData = FreeGameAPI.fetchDataByDefault();
  }

  fetchGame() async {
    var url = 'https://www.freetogame.com/api/games';
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
    var gameTitle = index['title'];
    var gameThumb = index['thumbnail'];
    var gamePlatform = index['platform'];
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
            title: Row(
          children: [
            Container(
              width: 200,
              height: 115,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(image: NetworkImage(gameThumb))),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(gameTitle), Text(gamePlatform)],
            )
          ],
        )),
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
        title: const Text('Free Game List'),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SearchScreen())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: getBody(),
      /*Column(
          children: [
            /*FutureBuilder(
              future: freegameData,
              builder: (context, AsyncSnapshot<FreegameData> snapshot) {
                List<Widget> myChildren = [];
                if (snapshot.hasData) {
                  var thumbnailLink = snapshot.data!.thumbnail.toString();
                  myChildren.add(
                    CachedNetworkImage(
                      imageUrl: '$thumbnailLink',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                  myChildren.add(Text(snapshot.data!.id.toString()));
                  myChildren.add(Text(snapshot.data!.title.toString()));
                  myChildren.add(Text(snapshot.data!.platform.toString()));
                } else if (snapshot.hasError) {
                  myChildren.add(Text(snapshot.error.toString()));
                } else {
                  myChildren.add(const Text('Waiting . . .'));
                }
                return Column(children: myChildren);
              },
            ),*/
            TextButton(
                onPressed: () async {
                  idNumber = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                  if (idNumber != null) {
                    freegameData =
                        FreeGameAPI.fetchDataByIDSearch(id: idNumber);
                    setState(() {});
                  }
                },
                child: const Text('Search'))
          ],
        )*/
    );
  }
}
