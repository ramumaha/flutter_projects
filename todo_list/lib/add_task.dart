import 'package:flutter/material.dart';
import 'package:todo_list/models/tasks.dart';
import 'package:todo_list/task_card.dart';

class AddTask extends StatefulWidget {
  AddTask(this.tasksList, {super.key});

  List<Tasks> tasksList;

  @override
  State<StatefulWidget> createState() => _AddTask();
}

class _AddTask extends State<AddTask> {
  final _taskNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: _taskNameController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Task Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Description'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: ElevatedButton(
                  onPressed: () => _dialogBuilder(context),
                  child: const Text('ADD')))
        ],
      ),
    );
  }

  _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("TASK"),
            content: Column(children: <Widget>[
              Row(children: <Widget>[
                const Text("TaskName : "),
                Text(_taskNameController.text)
              ]),
              const Padding(padding: EdgeInsets.all(3.0)),
              Row(children: <Widget>[
                const Text("Description : "),
                Text(_descriptionController.text)
              ]),
              const Padding(padding: EdgeInsets.all(3.0)),
              Row(children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.tasksList.add(Tasks(_taskNameController.text,
                            _descriptionController.text));
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TaskCard(widget.tasksList),
                            settings: RouteSettings(
                              arguments: widget.tasksList,
                            )),
                      );
                    },
                    child: const Text("OK")),
                const Padding(padding: EdgeInsets.all(3.0)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("EDIT"))
              ]),
            ]),
          );
        });
  }
}
