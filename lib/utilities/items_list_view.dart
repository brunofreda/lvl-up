import 'package:flutter/material.dart';

import 'task_tile.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({
    super.key,
    required this.itemsList,
    required this.itemCheckBoxChanged,
    required this.itemEditButtonOnPressed
  });

  final List itemsList;
  final void Function(bool?, int) itemCheckBoxChanged;
  final void Function(int) itemEditButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskText: itemsList[index][0],
          taskComplete: itemsList[index][1],
          taskDate: itemsList[index][2],
          checkBoxOnChanged: (value) => itemCheckBoxChanged(value, index),
          editButtonOnPressed: () => itemEditButtonOnPressed(index),
        );
      },
    );
  }
}
