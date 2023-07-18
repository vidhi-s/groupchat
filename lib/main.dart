import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat/screens/home.dart';
import 'package:chat/screens/login.dart';
import 'package:chat/screens/registration.dart';
import 'package:chat/screens/chat.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Chat());
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: home.id,

      routes: {

        home.id: (context) => const home(),

        login.id: (context) => const login(),
        registration.id:(context)=> registration(),
        chat.id:(context)=>const chat()
      },
    );
  }
}