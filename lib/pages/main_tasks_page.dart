import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lvl_up/utilities/score_counter.dart';

import '../utilities/add_item_button.dart';
import '../utilities/tasks_list_visualizer.dart';
import '../utilities/score_counter.dart';
import '../utilities/setting_check_button_option.dart';

class MainTasksPage extends StatefulWidget {
  const MainTasksPage({super.key});

  @override
  State<MainTasksPage> createState() => _MainTasksPageState();
}

class _MainTasksPageState extends State<MainTasksPage> {
  int score = 0;
  bool hideCompletedTasks = false;
  final textController = TextEditingController();
  final List mainTasksList = [
    ['Task 1', false, '31/7/2023'],
  ];

  void completedTasksBehavior(bool value) {
      hideCompletedTasks = value;
  }

  void taskCheckBoxChanged(bool? value, int index) {
    setState(() {
      mainTasksList[index][1] = !mainTasksList[index][1];

      if (mainTasksList[index][1] == true) {
        score++;
      } else if (mainTasksList.isNotEmpty) {
        score--;
      }
    });
  }

  void addTask() {
    setState(() {
      // TODO : Set date dynamically
      mainTasksList.add([textController.text, false, '']);

      textController.clear();
    });

    Navigator.pop(context);
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
        leading: ScoreCounter(
          score: score,
        ),
        actions: [
          SettingCheckButtonOption(
            booleanValue: hideCompletedTasks,
            settingText: 'Hide completed tasks',
            onChangedFunction: completedTasksBehavior,
          ),
        ]
      ),
      body: TasksListVisualizer(
          tasksList: mainTasksList,
          checkBoxChanged: taskCheckBoxChanged,
      ),
      floatingActionButton: AddItemButton(
        addItemButtonContext: context,
        itemsList: mainTasksList,
        itemTextController: textController,
        addButtonOnSaveFunction: addTask,
      ),
    );
  }
}
