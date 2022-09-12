import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:w_10/screens/chat_screen.dart';
import 'package:w_10/componants/my_button.dart';
import 'package:w_10/componants/my_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';
import 'package:path/path.dart' as pathPackage;

import '../componants/input_with_error_text.dart';
import '../componants/user_image_picker.dart';

class RegistryScreen extends StatefulWidget {
  static const id = 'RegistryScreen';
  const RegistryScreen({Key? key}) : super(key: key);

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  late File _avatar;
  final _auth = FirebaseAuth.instance;
  late final InputWithErrorText _username = InputWithErrorText();
  late final InputWithErrorText _email = InputWithErrorText();
  late final InputWithErrorText _password = InputWithErrorText();

  void _pickedImageFile({required File pickedImageFile}) {
    _avatar = pickedImageFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('RegistryScreen')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: const [
                SizedBox(
                  height: 60,
                  child: Hero(
                      tag: 'logo',
                      child:
                          Image(image: AssetImage('assets/images/letter.png'))),
                ),
                Expanded(
                    child: Text('Create a new account',
                        style: TextStyle(fontSize: 32))),
              ],
            ),
            UserImagePicker(callback: _pickedImageFile),
            MyForm(input: _username, hideText: false, labelText: 'Username'),
            MyForm(input: _email, hideText: false, labelText: 'Email'),
            MyForm(input: _password, hideText: true, labelText: 'Password'),
            MyButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await _auth.createUserWithEmailAndPassword(
                            email: _email.valueText,
                            password: _password.valueText);
                    if (userCredential.user != null) {
                      String? avatarURL;
                      try {
                        String ext = pathPackage.extension(_avatar.path);
                        String filename = '${userCredential.user!.uid}$ext';
                        Reference storageRef = FirebaseStorage.instance.ref();
                        Reference avatarRef = storageRef
                            .child(filename)
                            .child('user_avatar')
                            .child(filename);
                        await avatarRef.putData(_avatar.readAsBytesSync());
                        avatarURL = await avatarRef.getDownloadURL();
                      } on FirebaseException catch (e) {
                        log(e.toString());
                      }
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(_email.valueText.toString())
                          .set({
                        'username': _username.valueText,
                        'avatarURL': avatarURL,
                        'uid': userCredential.user!.uid
                      });
                      if (!mounted) return;
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      log('This password to weak');
                    } else if (e.code == 'email-already-in-use') {
                      log('This email already use');
                    } else {
                      log('At first case');
                      log(e.toString());
                    }
                  } catch (e) {
                    log('At second case');
                    log(e.toString());
                  }
                },
                buttonText: 'Create an account'),
          ],
        ));
  }
}
