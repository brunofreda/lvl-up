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
  int score = 0;
  bool removeCompletedTasks = false;
  final List mainTasks = [
    ['Task 1', false],
  ];
  final addFormKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();

  void taskBehavior(bool? value) {
    setState(() {
      removeCompletedTasks = !removeCompletedTasks;
      print(removeCompletedTasks);
    });
  }

  void taskCheckBoxChanged(bool? value, int index) {
    setState(() {
      mainTasks[index][1] = !mainTasks[index][1];
    });
  }

  void changeScore(bool value) {
    setState(() {
      if (value) {
        score++;
      } else {
        score--;
      }
    });
  }

  void addTask(newTask) {
    setState(() {
      mainTasks.add(newTask);
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
            '$score',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          SettingCheckButtonOption(
            booleanValue: removeCompletedTasks,
            onChangedFunction: taskBehavior,
          )
        ]
      ),
      body: ItemsListVisualizer(
          removeCheckedItem: removeCompletedTasks,
          itemsList: mainTasks,
          checkBoxChanged: taskCheckBoxChanged,
          scoreModifier: changeScore,
      ),
      floatingActionButton: AddItemButton(
        formKey: addFormKey,
        function: addTask,
      ),
    );
  }
}
