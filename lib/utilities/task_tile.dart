import 'package:flutter/material.dart';

import 'item_dialog_box.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskText,
    required this.taskComplete,
    required this.taskDate,
    required this.checkBoxOnChangedFunction,
    required this.editButtonOnPressedFunction
  });

  final String taskText;
  final bool taskComplete;
  final String taskDate;
  final void Function(bool?)? checkBoxOnChangedFunction;
  final void Function()? editButtonOnPressedFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: taskComplete,
                    shape: const CircleBorder(),
                    side: const BorderSide(color: Colors.white),
                    activeColor: Colors.white,
                    checkColor: Colors.blueGrey[200],
                    onChanged: checkBoxOnChangedFunction,
                  ),
                  Text(
                    taskText,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: taskComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    taskDate,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: editButtonOnPressedFunction,
                    icon: const Icon(Icons.edit),
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}
