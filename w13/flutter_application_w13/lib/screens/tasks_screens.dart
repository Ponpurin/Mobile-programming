import 'package:flutter/material.dart';
import 'package:flutter_application_w13/componants/task_listview.dart';
import 'package:flutter_application_w13/screens/add_task_screen.dart';
import 'package:flutter_application_w13/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTaskScreen())),
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const CircleAvatar(
                      radius: 25.55,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.list)),
                  Column(
                    children: [
                      const Text('Todo',
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                      Text('${Provider.of<TaskData>(context).count} tasks.',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: const TaskListview(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
