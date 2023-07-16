import 'package:flutter/material.dart';
import 'package:chat/constants/textfieldstyle.dart';
import 'package:chat/componants/padding.dart';

class login extends StatefulWidget {
  static String id="login";
  const login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
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
            Hero(tag: 'logo',
              child: SizedBox(
                height: 170.0,
                child: Image.asset('images/sup.jpg'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: textfieldstyle.copyWith(hintText: 'Enter the Email')
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: textfieldstyle.copyWith( hintText: 'Enter your password.')

            ),
            const SizedBox(
              height: 24.0,
            ),
            padding(text: 'Log in',colour: Colors.blueAccent,onpressed:(){}
            ),
          ],
        ),
      ),
    );
  }
}