import 'package:flutter/material.dart';

class ItemDialogBox extends StatelessWidget {
  const ItemDialogBox({
    super.key,
    required this.hintString,
    required this.itemDialogBoxTextFieldController,
    required this.itemsList,
    required this.itemIndex
  });

  final String hintString;
  final itemDialogBoxTextFieldController;
  final List itemsList;
  final int itemIndex;

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
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            if (itemIndex > -1) {
                              print('$itemIndex');
                            }

                            Navigator.pop(context);
                          }
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          icon: const Icon(Icons.access_time),
                          onPressed: () {


                            if (itemIndex > -1) {
                              print('$itemIndex');
                            }
                          },
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
