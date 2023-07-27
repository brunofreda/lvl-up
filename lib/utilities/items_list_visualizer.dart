import 'package:flutter/material.dart';

import '../utilities/tile.dart';

class ItemsListVisualizer extends StatelessWidget {
  ItemsListVisualizer({
    super.key,
    required this.removeCheckedItem,
    required this.itemsList,
    required this.checkBoxChanged,
    required this.scoreModifier
  });

  bool removeCheckedItem;
  final List itemsList;
  final Function(bool? value, int index) checkBoxChanged;
  final Function scoreModifier;

  @override
  Widget build(BuildContext context) {
    return itemsList.isEmpty
        ? const Center(
            child: Text(
              'Tap the plus button to add a task',
              style: TextStyle(color: Colors.grey),
            ),
          )
        : ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (context, index) {
              return removeCheckedItem
                ? Tile(
                    tileText: itemsList[index][0],
                    tileComplete: itemsList[index][1],
                    onChangedFunction: (value) => checkBoxChanged(value, index),
                  )
                : Tile(
                    tileText: itemsList[index][0],
                    tileComplete: itemsList[index][1],
                    onChangedFunction: (value) => checkBoxChanged(value, index),
                  );
            },
          );
  }

  // void checkBox
}
