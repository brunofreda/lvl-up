import 'package:flutter/material.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    super.key,
    required this.formKey,
    required this.hintString,
    required this.addFunction
  });

  final GlobalKey<FormState> formKey;
  final String hintString;
  final void Function(String? newItem) addFunction;

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
                            decoration: InputDecoration(
                              hintText: hintString,
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                            autofocus: true,
                            onSaved: (newItem) => addFunction(newItem),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // TODO : Abstract this two buttons after giving them
                            // TODO > functionality
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

// DatePickerDialog(
//   initialDate: DateTime.now(),
//   firstDate: DateTime.now(),
//   lastDate: DateTime(2024)),
// ,
}
