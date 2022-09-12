import 'package:circle_calculator/screens/input_screen.dart';
import 'package:circle_calculator/circle.dart' as circle;
import 'package:flutter/material.dart';
import 'package:circle_calculator/constant.dart';

class ResultScreen extends StatelessWidget {
  final int radius;
  const ResultScreen({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radiusArea = circle.Circle.calculateArea(radius: radius);
    double radiusLenght = circle.Circle.calculateLength(radius: radius);

    return Scaffold(
      appBar: AppBar(title: const Text('Circle Calculator')),
      body: Column(
        children: [
          Expanded(
            //Widget Card
            child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1d1f33),
                borderRadius: BorderRadius.circular(12.0),
              ),
              //widgets for on screen
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Circle Area',
                        style: kText,
                      ),
                      Text(
                        radiusArea.toStringAsFixed(1),
                        style: kTextNumber,
                      ),
                      const Text(
                        'Circle Lenght',
                        style: kText,
                      ),
                      Text(
                        radiusLenght.toStringAsFixed(1),
                        style: kTextNumber,
                      ),
                    ],
                  ),
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
                    builder: (context) => const InputScreen(),
                  ),
                );
              },
              child: const Center(
                  child: Text(
                'Re-Calculate',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
