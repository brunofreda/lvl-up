import 'package:flutter/material.dart';

import '../utilities/item_dialog_box.dart';

class AddItemButton extends StatelessWidget {
  AddItemButton({
    super.key,
    required this.addItemButtonContext,
    required this.itemsList,
    required this.itemTextController,
    required this.addButtonOnSaveFunction
  });

  final BuildContext addItemButtonContext;
  final List itemsList;
  final itemTextController;
  final void Function()? addButtonOnSaveFunction;

  void bottomDialogBox() {
    showModalBottomSheet(
      context: addItemButtonContext,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ItemDialogBox(
            hintString: 'Task',
            itemDialogBoxTextFieldController: itemTextController,
            itemsList: itemsList,
            itemIndex: -1,
            itemDialogOnSaveFunction: addButtonOnSaveFunction,
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: bottomDialogBox,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
