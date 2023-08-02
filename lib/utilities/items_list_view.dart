import 'package:flutter/material.dart';

import 'task_tile.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    super.key,
    required this.itemsList,
    required this.itemCheckBoxChanged,
    required this.itemEditButtonOnPressed,
    required this.updateTilesFunction
  });

  final List itemsList;
  final void Function(bool?, int) itemCheckBoxChanged;
  final void Function(int) itemEditButtonOnPressed;
  final void Function(int, int) updateTilesFunction;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: ReorderableListView.builder(
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return TaskTile(
            key: ValueKey(index),
            taskText: itemsList[index][0],
            taskComplete: itemsList[index][1],
            taskDate: itemsList[index][2],
            taskDatePicked: itemsList[index][3],
            checkBoxOnChanged: (value) => itemCheckBoxChanged(value, index),
            editButtonOnPressed: () => itemEditButtonOnPressed(index),
          );
        },
        onReorder: (oldIndex, newIndex) => updateTilesFunction(oldIndex, newIndex),
      ),
    );
  }
}
