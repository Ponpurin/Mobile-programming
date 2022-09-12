import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SenderAvatar extends StatelessWidget {
  const SenderAvatar({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    //Text(data['avatar_url']);
    String email = data['sender'];
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('users').doc(email).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'));
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return const CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return CircleAvatar(
              backgroundImage: NetworkImage(data['avatar_user']));
        }
        return const SizedBox(
            width: 20, height: 20, child: CircularProgressIndicator());
      },
    );
  }
}
