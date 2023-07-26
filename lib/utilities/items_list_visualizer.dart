import 'package:flutter/material.dart';

import '../utilities/tile.dart';

class ItemsListVisualizer extends StatelessWidget {
  const ItemsListVisualizer({super.key, required this.itemsList});

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
        : // Text('$itemsList');
          ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (context, index) {
              return Tile(
                tileText: itemsList[0],
                tileComplete: itemsList[1],
                onChangedFunction: (p0) => 0,
              );
            },
          );
  }
}
