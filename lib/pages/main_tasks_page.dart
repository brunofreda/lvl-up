import 'package:flutter/material.dart';

import '../utilities/add_item_button.dart';
import '../utilities/items_list_visualizer.dart';
import '../utilities/navbar.dart';

class MainTasksPage extends StatefulWidget {
  const MainTasksPage({super.key});

  @override
  State<MainTasksPage> createState() => _MainTasksPageState();
}

class _MainTasksPageState extends State<MainTasksPage> {
  final List<String?> _mainTasks = [];
  final formKey = GlobalKey<FormState>();

  void _addTask(newTask) {
    setState(() {
      _mainTasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Navbar(),
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
        function: _addTask,
      ),
    );
  }
}
