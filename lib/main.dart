import 'package:flutter/material.dart';
import 'package:chat/screens/home.dart';
import 'package:chat/screens/login.dart';
import 'package:chat/screens/registration.dart';
import 'package:chat/screens/chat.dart';


void main() => runApp(const Chat());

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: home.id,

      routes: {

        home.id: (context) => const home(),

        login.id: (context) => const login(),
        registration.id:(context)=>const registration(),
        chat.id:(context)=>const chat()
      },
    );
  }
}