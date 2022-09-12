import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  final Widget? content;
  final VoidCallback? callBack;
  const Card({
    Key? key,
    this.content,
    this.callBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1d1f33),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: content,
      ),
    );
  }
}
