import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tasks = [];
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('TO DO', style: TextStyle(fontWeight: FontWeight.bold))),
        backgroundColor: Colors.yellow[600],
      ),
      backgroundColor: Colors.yellow[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.yellow[300],
              title: const Text('Add a new task'),
              content: TextField(controller: inputController),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      if (inputController.text.isNotEmpty) tasks.add(inputController.text);
                      inputController.text = '';
                    });
                  },
                  child: const Text('Add'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    inputController.text = '';
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          );
        },
        backgroundColor: Colors.yellow[600],
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => ListItem(task: tasks[index]),
      ),
    );
  }
}
