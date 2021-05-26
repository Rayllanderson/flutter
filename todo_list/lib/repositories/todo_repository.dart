import 'package:dio/dio.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoRepository{

  final dio = Dio();

  final url = 'https://jsonplaceholder.typicode.com/todos';

  Future fetchTodos2() async{
    dio.get(url).then((value) => null)
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    return List.from(response.data)
        .map((json) => TodoModel.fromJson(json))
        .toList();
  }
}