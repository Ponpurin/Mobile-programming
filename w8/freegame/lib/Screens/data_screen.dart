import 'package:flutter/material.dart';
import 'package:freegame/data/freegame_by_id/freegame_by_id.dart';
import 'package:freegame/api/freegame_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:freegame/componant/style.dart';

class DataScreen extends StatefulWidget {
  final int id;
  const DataScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  Future<FreegameById>? freegameData;

  @override
  void initState() {
    super.initState();

    freegameData = FreeGameAPI.fetchDataByIDSearch(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.home,
                    size: 30,
                  ))
            ],
            title: const Center(
                child: Text('Game details', style: myHeadTextStyle)),
            automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                FutureBuilder(
                  future: freegameData,
                  builder: (context, AsyncSnapshot<FreegameById> snapshot) {
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
                      myChildren.add(Text(snapshot.data!.title.toString(),
                          style: myDataTextStyle));

                      myChildren.add(Text(
                          'Status : ' + snapshot.data!.status.toString(),
                          style: myDataTextStyle));

                      myChildren.add(Text(snapshot.data!.description.toString(),
                          style: myDataTextStyle));
                      myChildren.add(Text(
                          'General : ' + snapshot.data!.genre.toString(),
                          style: myDataTextStyle));
                      myChildren.add(Text(
                          'Platform : ' + snapshot.data!.platform.toString(),
                          style: myDataTextStyle));
                      myChildren.add(Text(
                          'Publisher : ' + snapshot.data!.publisher.toString(),
                          style: myDataTextStyle));
                      myChildren.add(Text(
                          'Developer : ' + snapshot.data!.developer.toString(),
                          style: myDataTextStyle));
                      myChildren.add(Text(
                          'Release Date : ' +
                              snapshot.data!.releaseDate.toString(),
                          style: myDataTextStyle));
                    } else if (snapshot.hasError) {
                      myChildren.add(Text(snapshot.error.toString(),
                          style: myDataTextStyle));
                    } else {
                      myChildren.add(
                          const Text('Waiting . . .', style: myDataTextStyle));
                    }
                    return Column(children: myChildren);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
