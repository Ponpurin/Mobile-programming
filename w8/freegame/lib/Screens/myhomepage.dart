import 'package:flutter/material.dart';
import 'package:freegame/api/freegame_api.dart';
import 'package:freegame/data/freegame_data/freegame_data.dart';
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

  @override
  void initState() {
    super.initState();

    freegameData = FreeGameAPI.fetchDataByDefaultID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Free Game Search')),
        body: Column(
          children: [
            FutureBuilder(
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
            ),
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
        ));
  }
}
