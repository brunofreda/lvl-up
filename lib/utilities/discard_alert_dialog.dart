import 'package:flutter/material.dart';

class DiscardAlertDialog extends StatelessWidget {
  const DiscardAlertDialog({
    super.key,
    required this.alertText,
    required this.previousContext
  });

  final String alertText;
  final BuildContext previousContext;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
          height: 120,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  alertText,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(previousContext);
                      },
                      child: const Text(
                        'Yes',
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'No',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
