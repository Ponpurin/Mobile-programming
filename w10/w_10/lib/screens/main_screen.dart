import 'package:flutter/material.dart';
import 'package:w_10/screens/registry_screen.dart';
import 'package:w_10/screens/sign_in_screen.dart';
import 'package:w_10/componants/my_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainScreen extends StatefulWidget {
  static const id = 'MainScreen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation animationColor;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      upperBound: 1,
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animationColor = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      //log(animationController.value.toStringAsFixed(3));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*backgroundColor:
            Colors.blueAccent.withOpacity(animationController.value),*/
        appBar: AppBar(title: const Text('MainScreen')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: animation.value * 100,
              child: const Hero(
                  tag: 'logo',
                  child: Image(image: AssetImage('assets/images/letter.png'))),
            ),
            Center(
              child: SizedBox(
                child: DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 30.0, fontFamily: 'Agne', color: Colors.black),
                  child: AnimatedTextKit(animatedTexts: [
                    TypewriterAnimatedText('Chattiely'),
                    TypewriterAnimatedText('Chattiely')
                  ]),
                ),
              ),
            ),
            MyButton(
              buttonText: 'Sign-in',
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.id);
              },
            ),
            MyButton(
                buttonText: 'Sign-up',
                onPressed: () {
                  Navigator.pushNamed(context, RegistryScreen.id);
                }),
          ],
        ));
  }
}
