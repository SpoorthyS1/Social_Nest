import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  const MyButton({super.key,
  required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 38,
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color(0xFFDAB9FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Sign In',
              style: TextStyle(
                color:  Color(0xFF008080),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}