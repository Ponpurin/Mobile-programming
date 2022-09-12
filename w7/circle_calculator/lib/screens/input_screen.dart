import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:circle_calculator/constant.dart';
import 'package:circle_calculator/screens/result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  var radius = 10;

  void setRadius(int value) {
    radius += value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Circle Calculator')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            //Widget Card
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1d1f33),
                borderRadius: BorderRadius.circular(12.0),
              ),
              //
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text('Radius', style: kText),
                      Text('$radius', style: kTextNumber),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() => setRadius(-1));
                            },
                            icon: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(FontAwesomeIcons.minus, size: 15),
                                )),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() => setRadius(1));
                            },
                            icon: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(FontAwesomeIcons.plus, size: 15),
                                )),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: 60,
            color: const Color.fromARGB(255, 0, 94, 156),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      radius: radius,
                    ),
                  ),
                );
              },
              child: const Center(
                  child: Text(
                'Calculate',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
