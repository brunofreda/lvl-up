import 'package:flutter/material.dart';

import '../utilities/dialog_box.dart';

class AddItemButton extends StatelessWidget {
  AddItemButton({
    super.key,
    required this.addItemButtonContext,
  });

  final BuildContext addItemButtonContext;
  final textController = TextEditingController();

  void bottomDialogBox() {
    showModalBottomSheet(
      context: addItemButtonContext,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DialogBox(
            hintString: 'Task',
            dialogBoxTextFieldController: textController,
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
