import 'package:flutter/material.dart';
import 'package:w_10/componants/chat/message/message_sender_name.dart';
import 'package:w_10/componants/chat/message/message_timestamp.dart';
import 'package:w_10/componants/chat/message/message_text.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    Key? key,
    required this.isMe,
    required this.data,
  }) : super(key: key);

  final bool isMe;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        MessageSenderName(data: data),
        MessageText(data: data),
        MessageTimestamp(data: data),
      ],
    );
  }
}
