import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lvl_up/utilities/items_list_view.dart';

import '../utilities/discard_alert_dialog.dart';
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
  final List mainTasksList = [];
  DateTime dateTimeVariable = DateTime.now();
  bool sortByDate = false;

  void completedTasksBehavior(bool value) {
    hideCompletedTasks = value;
  }

  void addTask() {
    setState(() {
      if (dateTimeVariable == DateTime.now()){
        mainTasksList.add([textController.text, false, '']);
      } else {
        mainTasksList.add([textController.text, false, dateTimeVariable.toString()]);
      }

      textController.clear();
    });

    print(mainTasksList);

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
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ItemDialogBox(
              hintString: 'Task',
              itemDialogBoxTextFieldController: textController,
              itemsList: mainTasksList,
              taskDate: '',
              itemDialogSaveFunction: addTask,
              itemDialogDeleteFunction: () => deleteItem(-1),
              dateTimePickerOnPressed: pickDate,
            ),
          );
        }
    );
  }

  void deleteItem(int taskIndex) {
    showDialog(
      context: context,
      builder: (builder){
        return DiscardAlertDialog(
          alertText: 'Are you sure you want to discard this task?',
          previousContext: context,
        );
      }
    );

    if (taskIndex > -1) {
     setState(() {
       mainTasksList.removeAt(taskIndex);
     });
    }
  }

  void pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        dateTimeVariable = value!;
      });
    });
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

  void editTask(int taskIndex) {
    setState(() {
      mainTasksList[taskIndex][0] = textController.text;
      mainTasksList[taskIndex][2] = '';
    });

    Navigator.pop(context);
  }

  void editItem(int itemIndex) {
    setState(() {
      textController.text = mainTasksList[itemIndex][0];
    });

    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          content: ItemDialogBox(
            hintString: 'Task',
            itemDialogBoxTextFieldController: textController,
            itemsList: mainTasksList,
            taskDate: mainTasksList[itemIndex][2], // mainTasksList[taskIndex][2],
            itemDialogSaveFunction: () => editTask(itemIndex),
            itemDialogDeleteFunction: () => deleteItem(itemIndex),
            dateTimePickerOnPressed: pickDate,
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
          : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      sortByDate = !sortByDate;
                    });
                  },
                  label: Text(
                    sortByDate
                    ? 'Date'
                    : 'My order'
                  ),
                  icon: const Icon(Icons.sort),
                ),
              ),
              Expanded(
                child: ItemsListView(
                  itemsList: mainTasksList,
                  itemCheckBoxChanged: taskCheckBoxChanged,
                  itemEditButtonOnPressed: editItem,
                ),
              ),
            ],
          ),
          // ListView.builder(
          //   itemCount: mainTasksList.length,
          //   itemBuilder: (context, index) {
          //     return TaskTile(
          //       taskText: mainTasksList[index][0],
          //       taskComplete: mainTasksList[index][1],
          //       taskDate: mainTasksList[index][2],
          //       checkBoxOnChanged: (value) => taskCheckBoxChanged(value, index),
          //       editButtonOnPressed: () => editItem(index),
          //     );
          //   },
          // ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
