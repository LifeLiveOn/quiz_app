import 'package:flutter/material.dart';

class UserAnswer extends StatelessWidget {
  const UserAnswer({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        color: Color.fromARGB(84, 11, 11, 11),
      ),
      textAlign: TextAlign.start,
    );
  }
}
