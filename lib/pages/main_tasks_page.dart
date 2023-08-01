import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/item_dialog_box.dart';
import '../utilities/score_counter.dart';
import '../utilities/setting_check_button_option.dart';
import '../utilities/task_tile.dart';

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

  void addItem() {
    setState(() {
      textController.clear();
    });

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom,
            ),
            child: ItemDialogBox(
              hintString: 'Task',
              itemDialogBoxTextFieldController: textController,
              itemsList: mainTasksList,
              taskDate: '',
              itemDialogOnSaveFunction: addTask,
            ),
          );
        }
    );
  }

  void editItem(int itemIndex) {
    setState(() {
      textController.text = mainTasksList[itemIndex][0];
    });
    // TODO: Make editTask clear the textController

    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          content: ItemDialogBox(
            hintString: 'Task',
            itemDialogBoxTextFieldController: textController,
            itemsList: mainTasksList,
            taskDate: mainTasksList[itemIndex][2], // mainTasksList[taskIndex][2],
            // TODO : Call editTask which should dynamically edit the contents
            itemDialogOnSaveFunction: () => Navigator.pop(context),
          ),
        );
      }
    );
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
      body: mainTasksList.isEmpty
          ? Center(
              child: Text(
                'Tap the plus button to add a task',
                style: TextStyle(color: Colors.blueGrey[200]),
              ),
            )
          : ListView.builder(
              itemCount: mainTasksList.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  taskText: mainTasksList[index][0],
                  taskComplete: mainTasksList[index][1],
                  taskDate: mainTasksList[index][2],
                  checkBoxOnChanged: (value) => taskCheckBoxChanged(value, index),
                  editButtonOnPressed: () => editItem(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
