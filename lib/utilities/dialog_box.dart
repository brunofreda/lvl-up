import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.hintString,
    required this.dialogBoxTextFieldController
  });

  final String hintString;
  final dialogBoxTextFieldController;

  // void onSavedFunction() {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
              child: TextField(
                controller: dialogBoxTextFieldController,
                decoration: InputDecoration(
                  hintText: hintString,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                autofocus: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          icon: const Icon(Icons.access_time),
                          onPressed: () => 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12, 12, 8),
                      child: ElevatedButton(
                        child: const Text('Save'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
// DatePickerDialog(
//   initialDate: DateTime.now(),
//   firstDate: DateTime.now(),
//   lastDate: DateTime(2024)),
// ,
}
