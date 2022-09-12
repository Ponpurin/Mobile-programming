import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wt7/screens/result_screen.dart';
import 'package:wt7/constant.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  var radius = 15;

  void setRadius(int value) {
    radius += value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Column(
                      children: [
                        const Text('Radius', style: myTextStyle),
                        Text('$radius', style: myNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  setRadius(-1);
                                });
                              },
                              icon: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.redAccent),
                                child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 12,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  setRadius(1);
                                });
                              },
                              icon: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.redAccent),
                                child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 12,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 60,
            color: const Color.fromARGB(255, 0, 107, 194),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              radius: radius,
                            )));
              },
              child: const Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
