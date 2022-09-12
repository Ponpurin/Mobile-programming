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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                //หลัง Refactor
                const Expanded(
                  child: MyButton(
                      animalName: 'bird',
                      animalSound: 'bird',
                      animalText: 'Bird'),
                ),
                //ก่อน Refactor
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Image(
                            image: AssetImage('assets/images/cat.png'),
                          ),
                          onPressed: () async {
                            await audioPlayer.play(
                                DeviceFileSource('assets/sounds/cat.wav'));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.volume_up),
                            Text('Cat'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Image(
                            image: AssetImage('assets/images/dog.png'),
                          ),
                          onPressed: () async {
                            await audioPlayer.play(
                                DeviceFileSource('assets/sounds/dog.wav'));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.volume_up),
                            const Text('Dog'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Image(
                            image: AssetImage('assets/images/frog.png'),
                          ),
                          onPressed: () async {
                            await audioPlayer.play(
                                DeviceFileSource('assets/sounds/frog.wav'));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.volume_up),
                            const Text('Frog'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Image(
                            image: AssetImage('assets/images/sheep.png'),
                          ),
                          onPressed: () async {
                            await audioPlayer.play(
                                DeviceFileSource('assets/sounds/sheep.wav'));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.volume_up),
                            const Text('Sheep'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Image(
                            image: AssetImage('assets/images/tiger.png'),
                          ),
                          onPressed: () async {
                            await audioPlayer.play(
                                DeviceFileSource('assets/sounds/tiger.wav'));
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.volume_up),
                            const Text('Tiger'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.animalName,
    required this.animalSound,
    required this.animalText,
  }) : super(key: key);

  final String animalName;
  final String animalSound;
  final String animalText;

  @override
  Widget build(BuildContext context) {
    final AudioPlayer audioPlayer = AudioPlayer();

    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          IconButton(
            icon: Image(
              image: AssetImage('assets/images/$animalName.png'),
            ),
            onPressed: () async {
              await audioPlayer
                  .play(DeviceFileSource('assets/sounds/$animalSound.wav'));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.volume_up),
              Text(animalText),
            ],
          ),
        ],
      ),
    );
  }
}
