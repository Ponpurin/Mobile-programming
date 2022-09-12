import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('W6'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            IconButton(
              icon: const Image(
                image: AssetImage('assets/images/bird.png'),
              ),
              onPressed: () async {
                await audioPlayer
                    .play(DeviceFileSource('assets/sounds/Bird.wav'));
              },
            ),
          ],
        )),
      ),
    );
  }
}
