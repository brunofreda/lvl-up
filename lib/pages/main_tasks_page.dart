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
  final List mainTasksList = [
    ['Task 1', false],
    ['Task 2', false],
    ['Task 3', false],
  ];
  final addFormKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();

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

  void addTask(newTask) {
    setState(() {
      mainTasksList.add(newTask);
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

      ),
    );
  }
}
