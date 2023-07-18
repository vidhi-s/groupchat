import 'package:flutter/material.dart';
import 'package:chat/componants/padding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat/constants/textfieldstyle.dart';
import 'chat.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class registration extends StatefulWidget {
  static String id="reg";


  @override
  _registrationState createState() => _registrationState();
}

class _registrationState extends State<registration> {
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
                child: Hero(
                  tag: 'logo',
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
                decoration:textfieldstyle.copyWith(hintText: 'Enter the Email')
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password=value;
                },
                decoration:textfieldstyle.copyWith(hintText: 'Enter Password')
              ),
              const SizedBox(
                height: 24.0,
              ),
              padding(text:'Register',colour:Colors.blueAccent,onpressed:()async{
                setState(() {
                  spinner=true;
                });
                try {
                  final newuser=await auth.createUserWithEmailAndPassword(
                      email:email.toString(), password:password.toString());
                  if (newuser!=null){
                    Navigator.pushNamed(context,"chat");
                  }
                  setState(() {
                    spinner=false;
                  });
              }

              catch(e){print(e);}
              }

              ),
            ],
          ),
        ),
      ),
    );
  }
}
