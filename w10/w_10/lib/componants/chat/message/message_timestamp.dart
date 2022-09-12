import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTimestamp extends StatelessWidget {
  const MessageTimestamp({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    // Text(DateFormat.yMMMd()
    //     .add_jm()
    //     .format(data['timestamp'].toDate())
    //     .toString()),
    DateTime timestamp = data['timestamp'].toDate();
    DateTime today = DateTime.now();
    Duration timeago = today.difference(timestamp);
    String text = DateFormat.yMMMd().format(timestamp);
    if (timeago.inDays < 1) {
      text = 'Today ${DateFormat.Hm().format(timestamp)}';
    }
    return Text(text);
  }
}
