import 'package:flutter/material.dart';

import '../utilities/tile.dart';

class ItemsListVisualizer extends StatelessWidget {
  ItemsListVisualizer({
    super.key,
    required this.removeItem,
    required this.itemsList
  });

  bool removeItem;
  final List itemsList;

  @override
  Widget build(BuildContext context) {
    return itemsList.isEmpty
        ? const Center(
            child: Text(
              'Tap the plus button to add a task',
              style: TextStyle(color: Colors.grey),
            ),
          )
        // TODO : Sort: By date/My order.
        : ListView(
            children: [
              Tile(
                tileText: itemsList.last,
                tileComplete: false,
                onChangedFunction: (p0) => 0,
              ),
            ],
          );

          // ListView.builder(
          //   itemCount: itemsList.length,
          //   itemBuilder: (context, index) {
          //     return removeItem
          //       ? Tile(
          //           tileText: itemsList[index][0],
          //           tileComplete: itemsList[index][1],
          //           onChangedFunction: (value) => 0,
          //         )
          //       : Tile(
          //           tileText: itemsList[index][0],
          //           tileComplete: itemsList[index][1],
          //           onChangedFunction: (value) => 0,
          //         );
          //   },
          // );
  }

  // void checkBox
}
