import 'package:flutter/material.dart';

import 'Task.dart';

class TaskItem extends StatelessWidget{
  final Task task;
  final onTaskChange;

    const TaskItem({super.key, required this.task, required this.onTaskChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){ onTaskChange(task);},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        tileColor: Colors.white,
        leading: Icon(task.isDone? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.deepPurple
        ),
        title: Text(task.text!!,
            style: TextStyle(fontSize: 16,
            color: Colors.black,
            decoration: task.isDone? TextDecoration.lineThrough : null)),
      ),
    );
  }
}