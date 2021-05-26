import 'package:flutter/cupertino.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final repository = TodoRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await repository.fetchTodos();
      state.value = HomeState.success;
    } catch (err) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
