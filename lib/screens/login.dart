import 'package:flutter/material.dart';
import 'package:chat/constants/textfieldstyle.dart';
import 'package:chat/componants/padding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class login extends StatefulWidget {
  static String id="login";
  const login({super.key});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool spinner=false;
   String? email;
   String? password;
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(tag: 'logo',
                  child: SizedBox(
                    height: 170.0,
                    child: Image.asset('images/sup.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email=value;
                },
                decoration: textfieldstyle.copyWith(hintText: 'Enter the Email')
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(obscureText: true,
                onChanged: (value) {
                 password=value;
                },
                decoration: textfieldstyle.copyWith( hintText: 'Enter password')

              ),
              const SizedBox(
                height: 24.0,
              ),
              padding(text: 'Log in',colour: Colors.blueAccent,onpressed:()async{
                setState(() {
                  spinner=true;
                });
               try{ final olduser= await auth.signInWithEmailAndPassword(
                    email: email.toString(), password: password.toString());
                if(olduser!=null){
                  Navigator.pushNamed(context, "chat");
                }
               setState(() {
                 spinner=false;
               });}
                   catch(e){
                 print(e);
                   }
              }
              ),
            ],
          ),
        ),
      ),
    );
  }
}