import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.hintString
  });

  final String hintString;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Task',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    labelStyle: TextStyle(
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
                            onPressed:() => 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            8.0,
                            12.0,
                            12.0,
                            8.0
                        ),
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
      ),
    );

// DatePickerDialog(
//   initialDate: DateTime.now(),
//   firstDate: DateTime.now(),
//   lastDate: DateTime(2024)),
// ,
}
