import 'package:flutter/material.dart';
import 'package:todo_list/models/tasks.dart';
import 'package:todo_list/task_card.dart';
// import 'package:todo_list/task_card.dart';

//show all the tasks in list

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<StatefulWidget> createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  // final List<Tasks> tasks = [
  //   Tasks('hello', 'hell'),
  //   Tasks('task2', 'taking task')
  // ];
  // List<Tasks> getTaskList() {
  //   List<Tasks> taskList = [];
  //   for (var i = 0; i < tasks.length; i++) {
  //     taskList.add(Tasks(tasks[i].name, tasks[i].description));
  //   }
  //   return taskList;
  // }

  @override
  Widget build(BuildContext context) {
    List<Tasks> taskList = [];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        body: TaskCard(taskList),
      ),
    );
  }
}
