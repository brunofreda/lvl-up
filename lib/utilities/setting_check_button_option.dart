import 'package:flutter/material.dart';

class SettingCheckButtonOption extends StatelessWidget {
  SettingCheckButtonOption({
    super.key,
    required this.booleanValue,
    required this.settingText,
    required this.onChangedFunction
  });

  var booleanValue;
  final String settingText;
  Function(bool) onChangedFunction;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          // padding: const EdgeInsets.all(1.0),
          child: StatefulBuilder(
            builder: (context, setState) => CheckboxListTile(
              title: Text(
                settingText,
                style: const TextStyle(fontSize: 14),
              ),
              value: booleanValue,
              onChanged: (newValue) {
                setState(() {
                  booleanValue = newValue!;

                  onChangedFunction(booleanValue);
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
        ),
    ],
    icon: const Icon(Icons.settings),
    offset: const Offset(0, 50),
    );
  }
}
