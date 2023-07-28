import 'package:flutter/material.dart';

import '../utilities/dialog_box.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    super.key,
  });

  void bottomDialogBox() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DialogBox(),
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
