import 'package:flutter/material.dart';
import 'package:flutter_application_w13/componants/task_listtile.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TaskListview extends StatelessWidget {
  const TaskListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.count,
        itemBuilder: (BuildContext context, int index) {
          final task = taskData.tasks[index];
          return TaskListtile(
              isChecked: task.isDone,
              taskTitle: task.title,
              checkboxCallback: (state) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              });
        },
      );
    });
  }
}
