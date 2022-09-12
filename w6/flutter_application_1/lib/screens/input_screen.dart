import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/card.dart' as my;
import 'package:flutter_application_1/components/card_content.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/screens/result_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  var maleColor = kActiveColor;
  var femaleColor = kInActiveColor;
  var heightSliderValue = 100;
  var weight = 55;
  void switchGenderColor() {
    var color = maleColor;
    maleColor = femaleColor;
    femaleColor = color;
  }

  void setWeight(int value) {
    weight += value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calulate'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: my.Card(
                    callBack: () => setState(() => switchGenderColor()),
                    content: CardContent(
                      color: maleColor,
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: my.Card(
                    callBack: () {
                      setState(() {
                        switchGenderColor();
                      });
                    },
                    content: CardContent(
                      color: femaleColor,
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: my.Card(
              content: Column(
                children: [
                  const Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$heightSliderValue',
                        style: kTextNumber,
                      ),
                      const Text('cm'),
                    ],
                  ),
                  Expanded(
                    child: Slider(
                      value: heightSliderValue.toDouble(),
                      min: 50,
                      max: 250,
                      onChanged: (double value) {
                        setState(() {
                          heightSliderValue = value.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: my.Card(
                    content: Column(
                      children: [
                        Text('$weight', style: kTextNumber),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  setWeight(1);
                                });
                              },
                              icon: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child:
                                        Icon(FontAwesomeIcons.plus, size: 15),
                                  )),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  setWeight(-1);
                                });
                              },
                              icon: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child:
                                        Icon(FontAwesomeIcons.minus, size: 15),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: my.Card()),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            height: 60,
            color: const Color(0xffeb1555),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      weight: weight,
                      height: heightSliderValue,
                    ),
                  ),
                );
              },
              child: const Center(
                  child: Text(
                'Calculate your BMI',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
