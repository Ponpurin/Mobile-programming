import 'package:flutter/material.dart';
import 'package:w_10/screens/chat_screen.dart';
import 'package:w_10/screens/main_screen.dart';
import 'package:w_10/screens/registry_screen.dart';
import 'package:w_10/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        MainScreen.id: (context) => const MainScreen(),
        RegistryScreen.id: (context) => const RegistryScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        ChatScreen.id: (context) => const ChatScreen()
      },
      initialRoute: MainScreen.id,
    );
  }
}
