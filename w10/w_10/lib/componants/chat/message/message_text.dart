import 'package:flutter/material.dart';
import 'package:w_10/componants/chat/message/sender/sender_avatar.dart';

class MessageText extends StatelessWidget {
  const MessageText({
    Key? key,
    required this.isMe,
    required this.data,
  }) : super(key: key);

  final bool isMe;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe ? Text(data['text']) : SenderAvatar(data: data),
        !isMe ? Text(data['text']) : SenderAvatar(data: data)
      ],
    );
  }
}
