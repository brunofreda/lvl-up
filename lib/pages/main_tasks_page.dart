import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lvl_up/utilities/score_counter.dart';

import '../utilities/add_item_button.dart';
import '../utilities/items_list_visualizer.dart';
import '../utilities/score_counter.dart';
import '../utilities/setting_check_button_option.dart';

class MainTasksPage extends StatefulWidget {
  const MainTasksPage({super.key});

  @override
  State<MainTasksPage> createState() => _MainTasksPageState();
}

class _MainTasksPageState extends State<MainTasksPage> {
  int score = 0;
  bool removeCompletedTasks = false;
  final List mainTasksList = [
    ['Task 1', false],
  ];
  final addFormKey = GlobalKey<FormState>();
  final editFormKey = GlobalKey<FormState>();

  void completedTasksBehavior(bool value) {
      removeCompletedTasks = value;
  }

  void taskCheckBoxChanged(bool? value, int index) {
    setState(() {
      mainTasksList[index][1] = !mainTasksList[index][1];
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
            booleanValue: removeCompletedTasks,
            onChangedFunction: completedTasksBehavior,
          ),
        ]
      ),
      body: ItemsListVisualizer(
          removeCheckedItem: removeCompletedTasks,
          itemsList: mainTasksList,
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
