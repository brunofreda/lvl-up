import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({super.key, required this.tileText});

  final String tileText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(tileText),
    );
  }
}
