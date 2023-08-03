import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../utilities/discard_alert_dialog.dart';
import '../utilities/item_dialog_box.dart';
import '../utilities/items_list_view.dart';
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
  final List mainTasksList = [];
  DateTime dateTimeVariable = DateTime.now();
  String dateText = '';
  bool datePicked = false;
  final GlobalKey dateTextGlobalKey = GlobalKey();
  bool sortByDate = false;

  void completedTasksBehavior(bool value) {
    hideCompletedTasks = value;
  }

  void addTask() {
    setState(() {
      // if (!datePicked){
      //   mainTasksList.add([
      //     textController.text,
      //     false,
      //     dateTimeVariable,
      //     false
      //   ]);
      // } else {
      //   mainTasksList.add([
      //     textController.text,
      //     false,
      //     dateTimeVariable,
      //     true
      //   ]);
      // }
      if (!datePicked){
        mainTasksList.add([
          textController.text,
          false,
          DateFormat('yyyy-MM-dd').format(dateTimeVariable),
          false
        ]);
      } else {
        mainTasksList.add([
          textController.text,
          false,
          DateFormat('yyyy-MM-dd').format(dateTimeVariable),
          true
        ]);
      }

      textController.clear();
    });

    datePicked = false;

    Navigator.pop(context);
  }

  void addItem() {
    setState(() {
      textController.clear();

      dateText = '';
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
              taskDate: dateText,
              dateTextKey: dateTextGlobalKey,
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

        if (dateTextGlobalKey.currentState != null && dateTextGlobalKey.currentState!.mounted) {
          dateTextGlobalKey.currentState!.setState(() {
            // dateText = DateFormat('dd/MM/yyyy').format(dateTimeVariable);
            dateText = DateFormat('yyyy-MM-dd').format(dateTimeVariable);
          });
        }
      });
    });

    datePicked = true;
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

      if (datePicked) {
        // mainTasksList[taskIndex][2] = DateFormat('dd/MM/yyyy').format(dateTimeVariable);
        mainTasksList[taskIndex][2] = DateFormat('yyyy-MM-dd').format(dateTimeVariable);
      }
    });

    datePicked = false;

    Navigator.pop(context);
  }

  void editItem(int itemIndex) {
    setState(() {
      textController.text = mainTasksList[itemIndex][0];

      dateText = mainTasksList[itemIndex][2];
    });

    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          content: ItemDialogBox(
            hintString: 'Task',
            itemDialogBoxTextFieldController: textController,
            itemsList: mainTasksList,
            taskDate: dateText, // mainTasksList[taskIndex][2],
            dateTextKey: dateTextGlobalKey,
            itemDialogSaveFunction: () => editTask(itemIndex),
            itemDialogDeleteFunction: () => deleteItem(itemIndex),
            dateTimePickerOnPressed: pickDate,
          ),
        );
      }
    );
  }

  void updateTiles(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }

      final tile = mainTasksList.removeAt(oldIndex);

      mainTasksList.insert(newIndex, tile);
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
                  isSortByDate: sortByDate,
                  itemCheckBoxChanged: taskCheckBoxChanged,
                  itemEditButtonOnPressed: editItem,
                  updateTilesFunction: updateTiles,
                ),
              ),
            ],
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
