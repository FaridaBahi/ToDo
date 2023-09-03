import 'package:flutter/material.dart';
import 'DoneTasks.dart';
import 'Task.dart';
import 'TaskItem.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = Task.taskslist();
  final toDoController = TextEditingController();
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  void handleTodoChange(Task task){
    setState(() {
      task.isDone= !task.isDone;
    });
  }
  void addToDoItem(String name){
    setState(() {
      todoList.add(Task(text: name));
    });
    toDoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  DoneTasks(todoList: todoList,)),
                );
              },
                  icon: const Icon(Icons.done_outline_outlined, color: Colors.white, size: 30)),
            SizedBox(width: 100,),
              const Text("ToDo")
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  /*Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: toDoController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(2),
                          prefixIcon:
                              Icon(Icons.search, color: Colors.black, size: 20),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 20, minWidth: 25),
                          border: InputBorder.none,
                          hintText: "Search here"),
                    ),
                  ),*/
                  Expanded(
                      child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text("All Tasks",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 30)),
                      ),
                      for (Task taskk in todoList)
                        TaskItem(
                          task: taskk,
                          onTaskChange: handleTodoChange,
                        )
                    ],
                  ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Form(
                key: formKey,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                            height: 55,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                shape: BoxShape.rectangle),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "add a new task"
                              ),
                              controller: toDoController,
                              validator: (String? value){
                                if(value!.isEmpty){
                                  return "Write a task";
                                }if(value.length<2){
                                  return "Enter a valid task";
                                }
                              },
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if(formKey.currentState!.validate()) {
                              addToDoItem(toDoController.text);
                            }
                            },
                          child: const Text("+", style: TextStyle(fontSize: 40),),
                        ),
                      )
                    ],
                  ),
              )
            )
          ],
        ),
    /*floatingActionButton: FloatingActionButton(
        onPressed: (){},
      backgroundColor: Colors.white,
      child: const Icon(Icons.navigation_rounded, color: Colors.purple,),
    ),*/);
  }
}
