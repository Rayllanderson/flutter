import 'package:flutter/material.dart';
import 'package:todo_list/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  _success() {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        });
  }

  elevatedButtonCentered(String message) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          //tentar novamente
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: _stateManagement(HomeState.start),
    );
  }
}
