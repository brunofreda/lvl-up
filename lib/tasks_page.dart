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
  // TODO : Make initial text/tasks appear/disappear.
  // TODO : Add task on popup window.
  // TODO : Add date on second popup window
  // TODO : Make date selected replace clock icon and make it
  // TODO > reappear if date is deleted.  // TODO: Create points counter.
  // TODO : Sort: By date/My order.
  // TODO : Give option whether to keep as scratched or delete completed
  // TODO > tasks.
  final formKey = GlobalKey<FormState>();
  final List<String?> _tasks = [];

  // DatePickerDialog(
  //   initialDate: DateTime.now(),
  //   firstDate: DateTime.now(),
  //   lastDate: DateTime(2024)),
  // ,

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
                itemsList: _tasks
            ),
          ],
        ),
      ),
      // TODO : Abstract button from scaffold
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  // TODO : Abstract form from scaffold
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            // TODO : Make the color of the hint text grey.
                            hintText: 'New task',
                          ),
                          onSaved: (newTask) {
                            setState(() {
                              _tasks.add(newTask);
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
              );
            }
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
            // TODO : Set the color of the text relating it with the theme
            style: TextStyle(color: Colors.grey),
          )
        : Text(
          '$itemsList',
          );
  }
}
