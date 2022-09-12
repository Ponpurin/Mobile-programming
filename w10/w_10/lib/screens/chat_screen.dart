import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:w_10/componants/chat/chat_stream_builder.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'ChatScreen';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //FirebaseFirestore.instance.collection('messages').snapshot;
  final Stream<QuerySnapshot> messageStream =
      FirebaseFirestore.instance.collection('messages').snapshots();
  User? user;
  String messageText = '';
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      //Todo: Throw error
    } else {
      log(user!.email.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
        title: const Text('ChatScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Collect data & create widget to show data
          ChatStreamBuilder(messageStream: messageStream, user: user),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    maxLines: null,
                    controller: textEditingController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      hintText: 'Type your message here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    textEditingController.clear();
                    CollectionReference messages =
                        FirebaseFirestore.instance.collection('messages');
                    messages.add({
                      'sender': user!.email,
                      'text': messageText,
                      'timestamp': Timestamp.now(),
                    });
                  },
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
