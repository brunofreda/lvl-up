import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  Tile({
    super.key,
    required this.tileText,
    required this.tileComplete,
    required this.onChangedValue
  });

  final String tileText;
  final bool tileComplete;
  Function(bool?)? onChangedValue;

  // TODO : Add circle button and make it modify "points"
  // TODO : Add edit button.
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
              Checkbox(value: tileComplete, onChanged: onChangedValue),
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
