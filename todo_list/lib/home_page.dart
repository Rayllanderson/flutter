import 'package:flutter/material.dart';
import 'package:todo_list/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();

  _success() {
    return ListView.builder(
        itemCount: controller.todos != null ? controller.todos.length : 0,
        itemBuilder: (context, index) {
          var todo = controller.todos[index];
          return ListTile(
            leading: Checkbox(value: todo.completed, onChanged: (value) {
              setState(() {
                todo.completed = !todo.completed;
              });
            },),
            title: Text(todo.title),
          );
        });
  }

  elevatedButtonCentered(String message) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          refreshPage();
        },
        child: Text(message),
      ),
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
              'Bem vindo',
              style: TextStyle(fontSize: 25),
            )),
        elevatedButtonCentered('Carregar Todo\'s')
      ],
    );
  }

  _stateManagement(HomeState state){
    switch(state){
      case HomeState.start:
        return _start();
      case HomeState.error:
        return elevatedButtonCentered('Tentar novamente');
      case HomeState.success:
        return _success();
      case HomeState.loading:
        return _loading();
      default:
        return _start();
    }
  }

  void refreshPage(){
    controller.start();
  }

  @override
  void initState() {
    super.initState();
    refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(icon: Icon(Icons.refresh_outlined),
              onPressed: refreshPage
          )],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return _stateManagement(controller.state.value);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
