import 'package:flutter/material.dart';

// TODO: Logo.
class TasksPage extends StatefulWidget {
  const TasksPage({super.key, required this.title});

  final String title;

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  // TODO: Make initial text/tasks appear/disappear.
  // TODO: Add task on popup window.
  // TODO: Add date on second popup window
  // TODO: Make date selected replace clock icon and make it
  // TODO > reappear if date is deleted.  // TODO: Create points counter.
  // TODO: Sort: By date/My order.
  // TODO: Give option whether to keep as scratched or delete completed
  // TODO > tasks.
  final formKey = GlobalKey<FormState>();
  final List<String?> _tasks = [];

  void _addTask(newTask) {
    setState(() {
      _tasks.add(newTask);
    });
  }

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
            // TODO: Set the color of the text relating it with the theme
            // TODO: Abstract the text, form and tasks from the scaffold
            const Text(
              'Tap the plus button to add a task',
              style: TextStyle(color: Colors.grey),
            ),
            Form(
              key: formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        // TODO: Make the color of the hint text grey.
                        hintText: 'New task',
                      ),
                      onSaved: (newTask) => _addTask(newTask),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                        onPressed:() => 0, icon: const Icon(Icons.access_time)
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '$_tasks',
            ),
          ],
        ),
      ),
      // TODO: Abstract button from scaffold
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
