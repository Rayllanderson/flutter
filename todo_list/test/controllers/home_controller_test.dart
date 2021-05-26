import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/controllers/home_controller.dart';

main(){

  final controller = HomeController();

  test('Deve preencher a lista de todos', () async {
    await controller.start();
    expect(controller.todos.isEmpty, false);
    expect(controller.todos.isNotEmpty, true);
  });
}