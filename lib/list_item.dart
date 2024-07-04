import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list/data/database.dart';

class ListItem extends StatefulWidget {
  final int taskIndex;
  final Function deleteTask;
  final TasksDatabase db;

  const ListItem({super.key, required this.db, required this.taskIndex, required this.deleteTask});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  void toggleTask() {
    setState(() {
      widget.db.toggleTask(widget.taskIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => widget.deleteTask(),
              icon: Icons.delete_outline,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => toggleTask(),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: widget.db.getTask(widget.taskIndex).checked,
                  onChanged: (value) => toggleTask(),
                  activeColor: Colors.black,
                ),
                Text(
                  widget.db.getTask(widget.taskIndex).text,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    decoration: widget.db.getTask(widget.taskIndex).checked ? TextDecoration.lineThrough : TextDecoration.none,
                    decorationThickness: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
