import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/card.dart' as my;
import 'package:flutter_application_1/screens/bmi.dart' as BMI;

class ResultScreen extends StatelessWidget {
  final int weight;
  final int height;
  const ResultScreen({Key? key, required this.weight, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bmi = BMI.BMI.calculate(weight: weight, height: height);
    String bmiCategory = BMI.BMI.category(bmi: bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calulate'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: my.Card(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$bmiCategory',
                      style: const TextStyle(color: Colors.green)),
                  Text(bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 72, fontWeight: FontWeight.bold)),
                  const Text('Good job!!'),
                ],
              ),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xffeb1555),
              ),
              minimumSize: MaterialStateProperty.all(
                const Size(double.infinity, 60),
              ),
            ),
            child: const Text(
              "Re-Calculate BMI",
              style: TextStyle(color: Color(0xffffffff)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
