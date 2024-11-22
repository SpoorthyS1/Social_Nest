import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{  
  final controller;
  final String hint;
  final bool obscureText;
const MyTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.obscureText,
    });

@override
Widget build(BuildContext context){
   return Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration:InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(color: Colors.grey.shade700),
                   ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A0DAD),),
                  ),
                  fillColor:  Color(0xFFF8F3FF),
                  filled:true,
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey[600]),
              ) ,
            ),
          );
}
}