

class Task{
  String? text;
  bool isDone;

  Task({
    required this.text,
    this.isDone = false
  });

  static List<Task> taskslist(){
    return [];
  }
}