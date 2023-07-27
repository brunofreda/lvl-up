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

  // TODO : Add circle button and make it modify "points"
  // TODO : Add edit button.
  // TODO : Add date data
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 17.0, 15.0, 5.0),
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
                  onChanged: onChangedFunction,
              ),
              Text(
                tileText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
