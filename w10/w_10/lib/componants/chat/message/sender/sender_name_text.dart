import 'package:flutter/material.dart';

class SenderNameText extends StatelessWidget {
  const SenderNameText({
    Key? key,
    required this.senderName,
  }) : super(key: key);

  final String senderName;

  @override
  Widget build(BuildContext context) {
    return Text(senderName);
  }
}
