import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final repository = TodoRepository();
  HomeState state = HomeState.start;

  Future start() async {
    state = HomeState.loading;
    todos = await repository
        .fetchTodos()
        .catchError((Object error) {
          state = HomeState.error;
        });
    state = HomeState.success;
  }
}

enum HomeState{
  start, loading, success, error
}
