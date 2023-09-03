import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Home.dart';

void main() {
  runApp(const Todo());
}

class Todo extends StatelessWidget{
  const Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    return MaterialApp(
      title: "Todo App",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
