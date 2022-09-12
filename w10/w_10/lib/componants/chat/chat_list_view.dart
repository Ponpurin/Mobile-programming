import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:w_10/componants/chat/chat_message.dart';

class ChatListView extends StatelessWidget {
  ChatListView({
    Key? key,
    required this.user,
    required this.snapshot,
  }) : super(key: key);

  AsyncSnapshot<QuerySnapshot> snapshot;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      children: snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        bool isMe = user!.email == data['sender'];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChatMessage(isMe: isMe, data: data),
        );
      }).toList(),
    );
  }
}
