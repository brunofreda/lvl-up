import 'package:flutter/material.dart';

class SettingCheckButtonOption extends StatelessWidget {
  SettingCheckButtonOption({
    super.key,
    required this.booleanValue,
    required this.onChangedFunction
  });

  var booleanValue;
  Function(bool?) onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          padding: const EdgeInsets.all(1.0),
          child: CheckboxListTile(
            title: const Text(
              'Remove task after completing it',
              style: TextStyle(fontSize: 12),
            ),
            value: booleanValue,
            onChanged: onChangedFunction,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
    ],
    icon: const Icon(Icons.settings),
    offset: const Offset(0, 50),
    );
  }
}
