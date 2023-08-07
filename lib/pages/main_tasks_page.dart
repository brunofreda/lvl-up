import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lvl_up/data/database.dart';

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
  final myBox = Hive.box('mybox');
  LvlUpDataBase db = LvlUpDataBase();

  @override
  void initState() {
    if (myBox.get('MAINTASKSLIST') == null
        || myBox.get('SCORE') == null
        || myBox.get('HIDECOMPLETEDTASKS') == null
        || myBox.get('SORTBYDATE') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final textController = TextEditingController();

  DateTime dateTimeVariable = DateTime.now();
  String dateText = '';
  bool datePicked = false;
  final GlobalKey dateTextGlobalKey = GlobalKey();

  void completedTasksBehavior(bool value) {
    setState(() {
      db.hideCompletedTasks = value;
    });

    db.updateDataBase();
  }

  void addTask() {
    setState(() {
      if (datePicked){
        db.mainTasksList.add([
          textController.text,
          false,
          DateFormat('yyyy-MM-dd').format(dateTimeVariable),
          true
        ]);
      } else {
        db.mainTasksList.add([
          textController.text,
          false,
          '',
          false
        ]);
      }

      textController.clear();
    });

    datePicked = false;

    Navigator.pop(context);

    db.updateDataBase();
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
              itemsList: db.mainTasksList,
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
       db.mainTasksList.removeAt(taskIndex);
     });
    }

    db.updateDataBase();
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

        if (dateTextGlobalKey.currentState != null &&
            dateTextGlobalKey.currentState!.mounted) {
          dateTextGlobalKey.currentState!.setState(() {
            dateText = DateFormat('yyyy-MM-dd').format(dateTimeVariable);
          });
        }
      });
    });

    datePicked = true;
  }

  void taskCheckBoxChanged(bool? value, int index) {
    setState(() {
      db.mainTasksList[index][1] = !db.mainTasksList[index][1];

      if (db.mainTasksList[index][1] == true) {
        db.score++;
      } else if (db.mainTasksList.isNotEmpty) {
        db.score--;
      }
    });

    db.updateDataBase();
  }

  void editTask(int taskIndex) {
    setState(() {
      db.mainTasksList[taskIndex][0] = textController.text;

      if (datePicked) {
        db.mainTasksList[taskIndex][2] = DateFormat('yyyy-MM-dd').format(dateTimeVariable);
      }
    });

    datePicked = false;

    Navigator.pop(context);

    db.updateDataBase();
  }

  void editItem(int itemIndex) {
    setState(() {
      textController.text = db.mainTasksList[itemIndex][0];

      dateText = db.mainTasksList[itemIndex][2];
    });

    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          content: ItemDialogBox(
            hintString: 'Task',
            itemDialogBoxTextFieldController: textController,
            itemsList: db.mainTasksList,
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

      final tile = db.mainTasksList.removeAt(oldIndex);

      db.mainTasksList.insert(newIndex, tile);
    });

    db.updateDataBase();
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
          score: db.score,
        ),
        actions: [
          SettingCheckButtonOption(
            booleanValue: db.hideCompletedTasks,
            settingText: 'Hide completed tasks',
            onChangedFunction: completedTasksBehavior,
          ),
        ]
      ),
      body: db.mainTasksList.isEmpty
          ? const Center(
              child: Text(
                'Tap the plus button to add a task',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      db.sortByDate = !db.sortByDate;
                    });

                    db.updateDataBase();
                  },
                  label: Text(
                    db.sortByDate
                    ? 'Date'
                    : 'My order'
                  ),
                  icon: const Icon(Icons.sort),
                ),
              ),
              Expanded(
                child: ItemsListView(
                  itemsList: db.mainTasksList,
                  isSortByDate: db.sortByDate,
                  itemCheckBoxChanged: taskCheckBoxChanged,
                  itemEditButtonOnPressed: editItem,
                  updateTilesFunction: updateTiles,
                  isHideCompletedTasks: db.hideCompletedTasks,
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
