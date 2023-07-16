import 'package:flutter/material.dart';
import 'package:chat/componants/padding.dart';

import 'package:chat/constants/textfieldstyle.dart';
class registration extends StatefulWidget {
  static String id="reg";
  const registration({super.key});

  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {
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
            Hero(
              tag: 'logo',
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
              decoration:textfieldstyle.copyWith(hintText: 'Enter the Email')
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:textfieldstyle.copyWith(hintText: 'Enter The Password')
            ),
            const SizedBox(
              height: 24.0,
            ),
            padding(text:'Register',colour:Colors.blueAccent,onpressed:(){}

            ),
          ],
        ),
      ),
    );
  }
}
