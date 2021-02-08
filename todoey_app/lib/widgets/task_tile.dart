import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function onCheckboxChanged;
  final Function onLongPress;

  TaskTile(
      {@required this.title,
      this.isChecked,
      this.onCheckboxChanged,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20.0,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onCheckboxChanged,
      ),
      onLongPress: onLongPress,
    );
  }
}
