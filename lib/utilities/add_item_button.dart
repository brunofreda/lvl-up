import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    super.key,
    required this.formKey,
    required this.function
  });

  final GlobalKey<FormState> formKey;
  final void Function(String? newItem) function;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: SizedBox(
                height: 200,
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Task',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            labelStyle: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                          autofocus: true,
                          onSaved: (newItem) => function(newItem),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // TODO : Abstract the buttons for clean code.
                          children: [
                            Flexible(
                              child: IconButton(
                                  onPressed:() => 0,
                                  icon: const Icon(Icons.access_time)
                              ),
                            ),
                            Flexible(
                              child: IconButton(
                                  onPressed:() => 0,
                                  icon: const Icon(Icons.delete)
                              ),
                            ),
                            Flexible(
                                child: ElevatedButton(
                                  child: const Text('Save'),
                                  onPressed: () {
                                    if (formKey.currentState?.validate() == true) {
                                      formKey.currentState?.save();
                                    }

                                    Navigator.pop(context);
                                  },
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        );
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

// TODO : Make date popup have the option "No date" and the date selected appear
// TODO > aside the clock icon.
// DatePickerDialog(
//   initialDate: DateTime.now(),
//   firstDate: DateTime.now(),
//   lastDate: DateTime(2024)),
// ,
}
