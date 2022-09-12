import 'package:flutter/material.dart';
import 'package:w_10/componants/chat/message/sender/sender_avatar.dart';

class MessageText extends StatelessWidget {
  const MessageText({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SenderAvatar(data: data),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blueAccent,
          ),
          child: Text(
            data['text'],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
