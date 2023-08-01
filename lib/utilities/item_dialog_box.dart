import 'package:flutter/material.dart';

class ItemDialogBox extends StatelessWidget {
  const ItemDialogBox({
    super.key,
    required this.hintString,
    required this.itemDialogBoxTextFieldController,
    required this.itemsList,
    required this.taskDate,
    required this.itemDialogOnSaveFunction
  });

  final String hintString;
  final itemDialogBoxTextFieldController;
  final List itemsList;
  final String taskDate;
  final void Function()? itemDialogOnSaveFunction;

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
                          // TODO : Make it so it asks you if are you sure to discard the task if there's whether something typed or a date selected
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
                      onPressed: itemDialogOnSaveFunction,
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
