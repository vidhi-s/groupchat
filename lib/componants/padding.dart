import 'package:flutter/material.dart';
class padding extends StatelessWidget {
  final Color colour;
  final String text;
  final VoidCallback onpressed;
  padding({
    required this.colour,required this.text,required this.onpressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:onpressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
