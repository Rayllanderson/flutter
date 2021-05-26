
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/repositories/todo_repository.dart';

void main(){

  final repository = TodoRepository();

  test('Deve trazer uma lista de Todo Model', () async {
    final todos = await repository.fetchTodos();
    final expectedTitle = 'delectus aut autem';
    expect(expectedTitle, todos[0].title);
  });
}