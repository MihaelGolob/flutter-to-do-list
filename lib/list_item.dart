import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String task;
  const ListItem({super.key, required this.task});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
      decoration: BoxDecoration(
        color: Colors.yellow[600],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            },
            activeColor: Colors.black,
          ),
          Text(
            widget.task,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
              decorationThickness: 3,
            ),
          ),
        ],
      ),
    );
  }
}
