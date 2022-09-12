import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:w_10/componants/chat/chat_list_view.dart';

class ChatStreamBuilder extends StatelessWidget {
  const ChatStreamBuilder({
    Key? key,
    required this.messageStream,
    required this.user,
  }) : super(key: key);

  final Stream<QuerySnapshot<Object?>> messageStream;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: messageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading . . .');
        }
        return Expanded(
          child: ChatListView(user: user, snapshot: snapshot),
        );
      },
    );
  }
}
