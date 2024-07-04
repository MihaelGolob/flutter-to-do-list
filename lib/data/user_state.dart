import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/data/task.dart';

part 'user_state.g.dart';

@HiveType(typeId: 0)
class UserState {
  @HiveField(0)
  List<Task> tasks = [];
}
