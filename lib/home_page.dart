import 'package:flutter/material.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController inputController = TextEditingController();
  TasksDatabase db = TasksDatabase();

  @override
  void initState() {
    db.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('TO DO', style: TextStyle(fontWeight: FontWeight.bold))),
        backgroundColor: Colors.yellow[300],
      ),
      backgroundColor: Colors.yellow[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              inputController.text = '';
              return AlertDialog(
                backgroundColor: Colors.yellow[300],
                title: const Text('Add a new task'),
                content: TextField(controller: inputController),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        if (inputController.text.isNotEmpty) db.addTask(inputController.text);
                      });
                    },
                    child: const Text('Add'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.yellow[600],
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.getTasksLength(),
        itemBuilder: (context, index) => ListItem(
          taskIndex: index,
          db: db,
          deleteTask: () => setState(() {
            db.deleteTask(index);
          }),
        ),
      ),
    );
  }
}
