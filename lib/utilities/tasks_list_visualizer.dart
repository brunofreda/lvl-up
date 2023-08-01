import 'package:flutter/material.dart';

import 'task_tile.dart';

class TasksListVisualizer extends StatelessWidget {
  TasksListVisualizer({
    super.key,
    required this.tasksList,
    required this.checkBoxOnChanged,
    required this.editButtonOnPressed
  });

  final List tasksList;
  final void Function(bool? value, int index) checkBoxOnChanged;
  final void Function()? editButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return tasksList.isEmpty
        ? Center(
            child: Text(
              'Tap the plus button to add a task',
              style: TextStyle(color: Colors.blueGrey[200]),
            ),
          )
        : ListView.builder(
            itemCount: tasksList.length,
            itemBuilder: (context, index) {
              return TaskTile(
                taskText: tasksList[index][0],
                taskComplete: tasksList[index][1],
                taskDate: tasksList[index][2],
                checkBoxOnChangedFunction: (value) => checkBoxOnChanged(value, index),
                editButtonOnPressedFunction: editButtonOnPressed,
              );
            },
          );
  }
  // void checkBox
}
