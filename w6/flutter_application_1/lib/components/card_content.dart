import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    Key? key,
    required this.icon,
    required this.label,
    this.color = Colors.white,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          color: color,
          size: 50,
        ),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
