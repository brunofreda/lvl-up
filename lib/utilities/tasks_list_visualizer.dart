import 'package:flutter/material.dart';

import '../utilities/task_tile.dart';

class TasksListVisualizer extends StatelessWidget {
  TasksListVisualizer({
    super.key,
    required this.tasksList,
    required this.checkBoxChanged,
  });

  final List tasksList;
  final Function(bool? value, int index) checkBoxChanged;

  @override
  Widget build(BuildContext context) {
    return tasksList.isEmpty
        ? const Center(
            child: Text(
              'Tap the plus button to add a task',
              style: TextStyle(color: Colors.grey),
            ),
          )
        : ListView.builder(
            itemCount: tasksList.length,
            itemBuilder: (context, index) {
              return TaskTile(
                taskText: tasksList[index][0],
                taskComplete: tasksList[index][1],
                onChangedFunction: (value) => checkBoxChanged(value, index),
              );
            },
          );
  }
  // void checkBox
}
