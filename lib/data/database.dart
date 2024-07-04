import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/data/task.dart';
import 'package:to_do_list/data/user_state.dart';

class TasksDatabase {
  // final _box = Hive.box<UserState>('user_state');

  UserState userState = UserState();

  void createInitialData() {
    userState.tasks = [
      Task('Buy groceries'),
      Task('Walk the dog'),
      Task('Do laundry'),
      Task('Add your own tasks :)'),
    ];
  }

  void loadData() {
    // userState = _box.get('user_state')!;
    userState = UserState();
  }

  void updateDatabase() {
    // _box.put('tasks', userState);
  }

  void addTask(String task) {
    userState.tasks.add(Task(task));
    updateDatabase();
  }

  void deleteTask(int index) {
    userState.tasks.removeAt(index);
    updateDatabase();
  }

  bool toggleTask(int index) {
    userState.tasks[index].checked = !userState.tasks[index].checked;
    updateDatabase();
    return userState.tasks[index].checked;
  }

  Task getTask(int index) {
    return userState.tasks[index];
  }

  int getTasksLength() {
    return userState.tasks.length;
  }

  void init() {
    // if (_box.get('user_state') == null) {
    //   createInitialData();
    // } else {
    //   loadData();
    // }
    createInitialData();
  }
}
