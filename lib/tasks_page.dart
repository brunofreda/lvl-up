import 'package:flutter/material.dart';

// TODO : Logo.
class MainTasksPage extends StatefulWidget {
  const MainTasksPage({super.key, required this.title});

  final String title;

  @override
  State<MainTasksPage> createState() => _MainTasksPageState();
}

class _MainTasksPageState extends State<MainTasksPage> {
  // TODO : Check in the tutorial if the scaffold and the formKey needs to be
  // TODO > abstracted from this class
  // TODO : Add date on second popup window
  // TODO : Make date selected replace clock icon and make it
  // TODO > reappear if date is deleted.  // TODO: Create points counter.
  // TODO : Sort: By date/My order.
  // TODO : Give option whether to keep as scratched or delete completed
  // TODO > tasks.
  final formKey = GlobalKey<FormState>();
  final List<String?> _tasks = [];

  void _addTask(newTask) {
    setState(() {
      _tasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ItemsListVisualizer(
                itemsList: _tasks,
            ),
          ],
        ),
      ),
      floatingActionButton: AddItemButton(
        formKey: formKey,
        hintString: 'New task',
        addFunction: _addTask,
      ),
    );
  }
}

class ItemsListVisualizer extends StatelessWidget {
  const ItemsListVisualizer({super.key, required this.itemsList});

  final List itemsList;

  @override
  Widget build(BuildContext context) {
    return itemsList.isEmpty
        ? const Text(
            'Tap the plus button to add a task',
            style: TextStyle(color: Colors.grey),
          )
        : Text(
          '$itemsList',
          );
  }
}

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
                          // TODO : Abstract this two buttons
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
