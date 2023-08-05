import 'package:flutter/material.dart';

class ScoreCounter extends StatelessWidget {
  ScoreCounter({super.key, required this.score});

  int score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.indigo[800],
        ),
        child: Center(
          child: Text(
            '$score',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
