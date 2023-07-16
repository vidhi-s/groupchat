import 'package:chat/screens/login.dart';
import 'package:chat/screens/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat/componants/padding.dart';

class home extends StatefulWidget {
  static String id = "home";
  const home({super.key});

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset(
                      'images/sup.jpg',
                      height: 100.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w900),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('  sup?',
                            speed: Duration(milliseconds: 300)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            padding(text: 'Log in',colour: Colors.blueAccent,onpressed:(){Navigator.pushNamed(context, "login");}),
            padding(text:'Register',colour:Colors.blueAccent,onpressed:(){Navigator.pushNamed(context, "login");},
            ),
          ],
        ),
      ),
    );
  }
}
