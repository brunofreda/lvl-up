import 'package:flutter/material.dart';

class ItemDialogBox extends StatelessWidget {
  const ItemDialogBox({
    super.key,
    required this.hintString,
    required this.itemDialogBoxTextFieldController,
    required this.itemsList,
    required this.itemIndex,
    required this.itemDialogOnSaveFunction
  });

  final String hintString;
  final itemDialogBoxTextFieldController;
  final List itemsList;
  final int itemIndex;
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
                    itemIndex > -1
                    ? itemsList[itemIndex][2]
                    : ''
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
// DatePickerDialog(
//   initialDate: DateTime.now(),
//   firstDate: DateTime.now(),
//   lastDate: DateTime(2024)),
// ,
}
