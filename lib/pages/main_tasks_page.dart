import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/add_item_button.dart';
import '../utilities/items_list_visualizer.dart';

class MainTasksPage extends StatefulWidget {
  const MainTasksPage({super.key});

  @override
  State<MainTasksPage> createState() => _MainTasksPageState();
}

class _MainTasksPageState extends State<MainTasksPage> {
  int points = 0;
  final List<String?> mainTasks = [];
  final formKey = GlobalKey<FormState>();

  void addTask(newTask) {
    setState(() {
      mainTasks.add(newTask);
    });
  }

  void addPoint() {
    setState(() {
      points++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'LvL Up',
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
            ),
          ),
        centerTitle: true,
        leading: Center(
          child: Text(
            '$points',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        // TODO : Make dialog box to choose whether to keep as scratched or
        // TODO > delete completed tasks
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => 0,
          ),
        ]
      ),
      body: ItemsListVisualizer(
          itemsList: mainTasks,
      ),
      floatingActionButton: AddItemButton(
        formKey: formKey,
        function: addTask,
      ),
    );
  }
}
