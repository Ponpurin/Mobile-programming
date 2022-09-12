import 'package:flutter/material.dart';
import 'package:wt7/constant.dart';
import 'package:wt7/screens/input_screen.dart';
import 'package:wt7/circle.dart';

class ResultScreen extends StatelessWidget {
  final int radius;
  const ResultScreen({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double area = Circle.areaCalculate(radius: radius);
    double lenght = Circle.lenghtCalculate(radius: radius);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      const Text('Circle Area', style: myTextStyle),
                      Text(area.toStringAsFixed(1), style: myNumberStyle),
                      const Text('Circle Lenght', style: myTextStyle),
                      Text(lenght.toStringAsFixed(1), style: myNumberStyle),
                    ],
                  ),
                ],
              ),
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
                        builder: (context) => const InputScreen()));
              },
              child: const Center(
                child: Text(
                  'Re-Calculate',
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
