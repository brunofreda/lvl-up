import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  Tile({
    super.key,
    required this.tileText,
    required this.tileComplete,
    required this.onChangedFunction
  });

  final String tileText;
  final bool tileComplete;
  Function(bool?)? onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Row(
            children: [
              Checkbox(
                value: tileComplete,
                shape: const CircleBorder(),
                side: const BorderSide(color: Colors.white),
                activeColor: Colors.white,
                checkColor: Colors.blueGrey[200],
                onChanged: onChangedFunction,
              ),
              Text(
                tileText,
                style: TextStyle(
                  color: Colors.white,
                  decoration: tileComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
