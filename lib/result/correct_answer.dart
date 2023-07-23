import 'package:flutter/material.dart';

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({super.key, required this.data});
  final String data;
  @override
  Widget build(context) {
    return Text(
      data,
      style: const TextStyle(
        color: Color.fromARGB(255, 49, 227, 251),
      ),
      textAlign: TextAlign.start,
    );
  }
}
