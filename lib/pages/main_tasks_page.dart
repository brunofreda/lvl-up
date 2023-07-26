import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/add_item_button.dart';
import '../utilities/items_list_visualizer.dart';
import '../utilities/setting_check_button_option.dart';

class MainTasksPage extends StatefulWidget {
  const MainTasksPage({super.key});

  @override
  State<MainTasksPage> createState() => _MainTasksPageState();
}

class _MainTasksPageState extends State<MainTasksPage> {
  int points = 0;
  bool removeTask = false;
  final List mainTasks = [];
  final addFormKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();

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

  void taskBehavior(bool? value) {
    setState(() {
      removeTask = !removeTask;
      print(removeTask);
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
        actions: [
          SettingCheckButtonOption(
            booleanValue: removeTask,
            onChangedFunction: taskBehavior,
          )
        ]
      ),
      body: ItemsListVisualizer(
          itemsList: mainTasks,
      ),
      floatingActionButton: AddItemButton(
        formKey: addFormKey,
        function: addTask,
      ),
    );
  }
}
