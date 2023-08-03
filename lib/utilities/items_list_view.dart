import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'task_tile.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    super.key,
    required this.itemsList,
    required this.isSortByDate,
    required this.itemCheckBoxChanged,
    required this.itemEditButtonOnPressed,
    required this.updateTilesFunction
  });

  final List itemsList;
  final bool isSortByDate;
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
          // final sortedItems = itemsList..sort((item1, item2) =>
          //   isSortByDate
          //     ? (DateFormat('yyyy-MM-dd').format(item1[2])).compareTo((DateFormat('yyyy-MM-dd').format(item2[2])))
          //     : item1.compareTo(item2));
          final sortedItems = itemsList..sort((item1, item2) =>
            isSortByDate
              ? item1[2].compareTo(item2[2])
              : item1[2].compareTo(item1[2]));
          final item = sortedItems[index];

          return TaskTile(
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
