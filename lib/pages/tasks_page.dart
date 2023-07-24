import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/add_item_button.dart';
import '../utilities/item_list_visualizer.dart';

// TODO : Logo.
class MainTasksPage extends StatefulWidget {
  const MainTasksPage({super.key, required this.title});

  final String title;

  @override
  State<MainTasksPage> createState() => _MainTasksPageState();
}

class _MainTasksPageState extends State<MainTasksPage> {
  // TODO : Add date on second popup window
  // TODO : Make date selected replace clock icon and make it
  // TODO > reappear if date is deleted.  // TODO: Create points counter.
  // TODO : Sort: By date/My order.
  // TODO : Give option whether to keep as scratched or delete completed
  // TODO > tasks.
  final formKey = GlobalKey<FormState>();
  final List<String?> _mainTasks = [];

  void _addTask(newTask) {
    setState(() {
      _mainTasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ItemsListVisualizer(
                itemsList: _mainTasks,
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
