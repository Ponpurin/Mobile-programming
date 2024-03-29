import 'package:flutter/material.dart';

class TaskListtile extends StatelessWidget {
  const TaskListtile(
      {Key? key,
      required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.longPressCallback})
      : super(key: key);

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final Function() longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        onChanged: checkboxCallback,
        value: isChecked,
        activeColor: Colors.blueAccent,
      ),
    );
  }
}
