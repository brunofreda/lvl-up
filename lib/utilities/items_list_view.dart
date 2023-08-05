import 'package:flutter/material.dart';

import 'task_tile.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    super.key,
    required this.itemsList,
    required this.isSortByDate,
    required this.itemCheckBoxChanged,
    required this.itemEditButtonOnPressed,
    required this.updateTilesFunction,
    required this.isHideCompletedTasks
  });

  final List itemsList;
  final bool isSortByDate;
  final void Function(bool?, int) itemCheckBoxChanged;
  final void Function(int) itemEditButtonOnPressed;
  final void Function(int, int) updateTilesFunction;
  final bool isHideCompletedTasks;

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
          final List sortedItems = itemsList.toList()..sort((item1, item2) =>
            isSortByDate
              ? item1[2].compareTo(item2[2])
              : item1[2].compareTo(item1[2])
          );

          final item = sortedItems[index];

          return isHideCompletedTasks
            ? item[1] == false
              ? TaskTile(
                  key: ValueKey(index),
                  taskText: item[0],
                  taskComplete: item[1],
                  taskDate: item[2],
                  taskDatePicked: item[3],
                  checkBoxOnChanged: (value) => itemCheckBoxChanged(value, index),
                  editButtonOnPressed: () => itemEditButtonOnPressed(index),
                )
              : Container(
                  key: ValueKey(index),
                )
            : TaskTile(
                key: ValueKey(index),
                taskText: item[0],
                taskComplete: item[1],
                taskDate: item[2],
                taskDatePicked: item[3],
                checkBoxOnChanged: (value) => itemCheckBoxChanged(value, index),
                editButtonOnPressed: () => itemEditButtonOnPressed(index),
              );
        },
        onReorder: (oldIndex, newIndex) => updateTilesFunction(oldIndex, newIndex),
      ),
    );
  }
}
