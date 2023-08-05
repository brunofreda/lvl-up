import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskText,
    required this.taskComplete,
    required this.taskDate,
    required this.taskDatePicked,
    required this.checkBoxOnChanged,
    required this.editButtonOnPressed
  });

  final String taskText;
  final bool taskComplete;
  final String taskDate;
  final bool taskDatePicked;
  final void Function(bool?)? checkBoxOnChanged;
  final void Function()? editButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.indigo[200],
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
                    checkColor: Colors.indigo[200],
                    onChanged: checkBoxOnChanged,
                  ),
                  Text(
                    taskText,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: taskComplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
                  Text(
                    taskDatePicked
                      // ? DateFormat('dd/MM/yyyy').format(taskDate)
                      ? taskDate
                      : '',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                  ),
                  IconButton(
                    onPressed: editButtonOnPressed,
                    icon: const Icon(Icons.edit),
                    color: Colors.white,
                  )
            ],
          ),
        ),
      );
  }
}
