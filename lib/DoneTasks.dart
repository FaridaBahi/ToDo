import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Task.dart';
import 'TaskItem.dart';

class DoneTasks extends StatefulWidget {
  final List<Task> todoList;
   DoneTasks({super.key, required this.todoList});
  @override
  State<DoneTasks> createState() => _DoneTasksState(todoList);
}

class _DoneTasksState extends State<DoneTasks> {
  List<Task> todoList;
  _DoneTasksState(this.todoList);
  void handleTodoChange(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  List<Task> getDoneTasks(List<Task> allTasks){
    List<Task> doneList= <Task>[];
    for(Task tas in allTasks){
      if(tas.isDone){
        doneList.add(tas);
      }
    }
    return doneList;
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(centerTitle: true,
            title: const Text("ToDo",
        ), backgroundColor: Colors.deepPurpleAccent),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text("Done Tasks",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 30)),
                    ),
                    for (Task taskk in getDoneTasks(todoList))
                      TaskItem(
                        task: taskk,
                        onTaskChange: handleTodoChange,
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
}