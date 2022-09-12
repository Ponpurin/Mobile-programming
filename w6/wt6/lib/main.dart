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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animal Sound'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: const [
                  Expanded(
                    child: AnimalSoundButton(
                        animalImageName: 'bird',
                        animalSoundName: 'bird',
                        animalTextName: 'Bird'),
                  ),
                  Expanded(
                    child: AnimalSoundButton(
                        animalImageName: 'cat',
                        animalSoundName: 'cat',
                        animalTextName: 'Cat'),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: AnimalSoundButton(
                        animalImageName: 'dog',
                        animalSoundName: 'dog',
                        animalTextName: 'Dog'),
                  ),
                  Expanded(
                    child: AnimalSoundButton(
                        animalImageName: 'frog',
                        animalSoundName: 'frog',
                        animalTextName: 'Frog'),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: AnimalSoundButton(
                        animalImageName: 'sheep',
                        animalSoundName: 'sheep',
                        animalTextName: 'Sheep'),
                  ),
                  Expanded(
                    child: AnimalSoundButton(
                        animalImageName: 'tiger',
                        animalSoundName: 'tiger',
                        animalTextName: 'Tiger'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimalSoundButton extends StatelessWidget {
  const AnimalSoundButton({
    Key? key,
    required this.animalImageName,
    required this.animalSoundName,
    required this.animalTextName,
  }) : super(key: key);

  final String animalImageName;
  final String animalSoundName;
  final String animalTextName;

  @override
  Widget build(BuildContext context) {
    final AudioPlayer audioplayer = AudioPlayer();
    return Container(
      margin: const EdgeInsets.only(top: 70.0),
      child: Column(children: [
        IconButton(
          onPressed: () async {
            await audioplayer
                .play(DeviceFileSource('assets/sounds/$animalSoundName.wav'));
          },
          icon: Image(
            image: AssetImage('assets/images/$animalImageName.png'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Icon(Icons.volume_up), Text(animalTextName)],
        ),
      ]),
    );
  }
}
