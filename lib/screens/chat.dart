import 'package:flutter/material.dart';
import 'package:chat/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chat extends StatefulWidget {
  static String id = "chat";
  const chat({super.key});

  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  final textcontroll=TextEditingController();
  final auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var loggeduser;
  String msg = 'hi';
  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  getcurrentuser() async {
    try {
      final user = await auth.currentUser;
      if (user != null) {
        loggeduser = user;
        print(loggeduser.email);
        print(loggeduser.password);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {

                auth.signOut();
                Navigator.pop(context);
              }),
        ],
        centerTitle: true,
        title: Text('sup?'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('messages').snapshots(),
                builder: (context, snapshot) {
                  List<textwidget> messageblock = [];
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                  }
                  final message = snapshot.data?.docs.reversed;

                  for (var a in message!) {
                    final text = a.get('message');
                    final sender = a.get('sender');
final currentuser=loggeduser.email;
                    final messagewidget =
                        textwidget(text: text, sender: sender,me:currentuser ==sender,);
                    messageblock.add(messagewidget);
                  }

                  return Expanded(
                      child: ListView(
                        reverse: true,
                    children: messageblock,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  ));
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textcontroll,
                      onChanged: (value) {
                        msg = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      textcontroll.clear();
                      firestore
                          .collection('messages')
                          .add({'message': msg, 'sender': loggeduser.email});
                    },
                    child: const Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class textwidget extends StatelessWidget {
  textwidget({this.text, this.sender,required this.me});
  String? text;
  String? sender;
  bool me;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:me? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(sender!,style: TextStyle(
            color: Colors.grey,
            fontSize: 10.0
          ),),
          Material(
            borderRadius: me?  BorderRadius.only(topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0)):BorderRadius.only(topRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
              elevation: 6.0,
              color: me? Colors.blueAccent:Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  text! ,
                  style:me?  TextStyle(color: Colors.white, fontSize: 15.0):TextStyle(color: Color(
                      0xE43D3636), fontSize: 15.0),
                ),
              )),
        ],
      ),
    );
  }
}
