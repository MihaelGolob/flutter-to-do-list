import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String text = '';
  @HiveField(1)
  bool checked = false;

  Task(this.text);
  Task.fromTask(this.text, this.checked);
}
