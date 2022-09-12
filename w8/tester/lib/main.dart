import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tester/api/freegame_api.dart';
import 'package:tester/data/game_data/game_data.dart';
import 'package:tester/screen/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? idNumber;
  Future<GameData>? gameData;

  @override
  void initState() {
    super.initState();

    gameData = FreeGameAPI.fetchGameDataMyDefaultID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Game'),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: gameData,
            builder: (context, AsyncSnapshot<GameData> snapshot) {
              List<Widget> myChildren = [];
              if (snapshot.hasData) {
                var thumbLink = snapshot.data!.thumbnail.toString();
                myChildren.add(
                  CachedNetworkImage(
                    imageUrl: '$thumbLink',
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                );
                myChildren.add(Text(snapshot.data!.id.toString()));
                myChildren.add(Text(snapshot.data!.title.toString()));
              } else if (snapshot.hasError) {
                myChildren.add(const Text('Error'));
              } else {
                myChildren.add(const Text('Waiting . . .'));
              }
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: myChildren);
            },
          ),
          TextButton(
              onPressed: () async {
                idNumber = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const Searchcreens()),
                  ),
                );
                if (idNumber != null) {
                  gameData = FreeGameAPI.fetchGameDataByID(id: idNumber);
                  setState(() {});
                }
              },
              child: const Text('Search'))
        ],
      ),
    );
  }
}
