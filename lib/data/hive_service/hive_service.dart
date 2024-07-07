import 'package:hive/hive.dart';
import 'package:to_do_app/data/model/todo.dart';

class HiveService {
  final String boxName = 'todos';

  Box<TodoModel> getTodoBox() {
    return Hive.box<TodoModel>(boxName); 
  }

  Future<void> addTodo(TodoModel todo) async {
    final box = getTodoBox();
    await box.add(todo);
  }

  List<TodoModel> getTodos() {
    final box = getTodoBox(); 
    return box.values.toList();
  }

  Future<void> updateTodo(int index, TodoModel todo) async {
    final box = getTodoBox();
    await box.putAt(index, todo);
  }

  Future<void> deleteTodo(int index) async {
    final box = getTodoBox();
    await box.deleteAt(index);
  }
}
