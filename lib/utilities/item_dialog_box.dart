import 'package:flutter/material.dart';

class ItemDialogBox extends StatelessWidget {
  const ItemDialogBox({
    super.key,
    required this.hintString,
    required this.itemDialogBoxTextFieldController,
    required this.itemsList,
    required this.taskDate,
    required this.itemDialogSaveFunction,
    required this.itemDialogDeleteFunction
  });

  final String hintString;
  final itemDialogBoxTextFieldController;
  final List itemsList;
  final String taskDate;
  final void Function()? itemDialogSaveFunction;
  final void Function()? itemDialogDeleteFunction;

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
                controller: itemDialogBoxTextFieldController,
                decoration: InputDecoration(
                  hintText: hintString,
                  hintStyle: const TextStyle(
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
                          // TODO : Make it so it asks you if are you sure to discard the task if there's whether something typed or a date selected
                          onPressed: itemDialogDeleteFunction,
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.access_time),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Text(
                    taskDate,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 12, 8),
                    child: ElevatedButton(
                      onPressed: itemDialogSaveFunction,
                      child: const Text('Save'),
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
}
