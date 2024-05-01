import 'package:flutter/material.dart';
import 'package:todo_list/add_task.dart';
import 'package:todo_list/models/tasks.dart';

class TaskCard extends StatefulWidget {
  TaskCard(this.taskList, {super.key});
  final List<Tasks> taskList;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.taskList.map((data) {
                        return ListTile(
                          leading: IconButton(
                              onPressed: () => _showDialog(context, data),
                              icon: const Icon(Icons.circle_outlined)),
                          title: Text(data.name),
                          subtitle: Text(data.description),
                        );
                      }).toList())),
            ),
            const Padding(padding: EdgeInsets.all(3.0)),
            Center(
              widthFactor: 12.0,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTask(widget.taskList),
                        ));
                  },
                  child: const Text("ADD")),
            )
          ]),
    );
  }

  _showDialog(BuildContext context, Tasks task) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("ALERT"),
            content: Column(
              children: [
                const Text("Press Ok to remove the task"),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.taskList
                                .removeWhere((element) => element == task);
                            Navigator.pop(context);
                          });
                        },
                        child: const Text("OK")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"))
                  ],
                )
              ],
            ),
          );
        });
  }
}
