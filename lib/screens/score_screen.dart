import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;

  const ScoreScreen({Key? key, required this.score}) : super(key: key);

@override
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Text("Your score: ${this.score}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 179, 165, 165))),
    ),
  );
}

}
