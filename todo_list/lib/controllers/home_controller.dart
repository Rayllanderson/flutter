import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final repository = TodoRepository();

  start() async {
    todos = await repository.fetchTodos();
  }
}
