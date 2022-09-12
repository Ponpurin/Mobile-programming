import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:w_10/componants/input_with_error_text.dart';
import 'package:w_10/screens/chat_screen.dart';
import 'package:w_10/componants/my_button.dart';
import 'package:w_10/componants/my_form.dart';

class SignInScreen extends StatefulWidget {
  static const id = 'SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //late String email;
  //late String password;
  late final InputWithErrorText _email = InputWithErrorText();
  late final InputWithErrorText _password = InputWithErrorText();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('SignInScreen')),
        body: ProgressHUD(
          child: Builder(
            builder: (BuildContext context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: const [
                    SizedBox(
                      height: 60,
                      child: Hero(
                          tag: 'logo',
                          child: Image(
                              image: AssetImage('assets/images/letter.png'))),
                    ),
                    Expanded(
                        child: Text('Sign In', style: TextStyle(fontSize: 32))),
                  ],
                ),
                MyForm(input: _email, hideText: false, labelText: 'Email'),
                MyForm(input: _password, hideText: true, labelText: 'Password'),
                MyButton(
                  onPressed: () async {
                    final progress = ProgressHUD.of(context);
                    progress?.showWithText('Loading . . .');
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _email.valueText,
                          password: _password.valueText);
                      if (!mounted) return;
                      Navigator.pushNamed(context, ChatScreen.id);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        _email.errorText = 'No user found';
                      } else if (e.code == 'wrong-password') {
                        _password.errorText = 'Wrong password';
                      } else {
                        _email.errorText = e.toString();
                      }
                    } catch (e) {
                      log(e.toString());
                    }
                    progress?.dismiss();
                  },
                  buttonText: 'Log-in',
                ),
              ],
            ),
          ),
        ));
  }
}
