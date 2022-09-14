import 'package:flutter/material.dart';
import 'package:flutter_application_w13/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String taskTitle = '';
    return Container(
      color: Colors.blueAccent,
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: ((value) {
                  taskTitle = value;
                }),
              ),
              TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(taskTitle);
                    Navigator.pop(context);
                  },
                  child: const Text('Add', textAlign: TextAlign.center))
            ],
          )),
    );
  }
}
