import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/app_controller.dart';

//Stateful = Com alteração, coisas que amos modificar.
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  AppController appController = AppController.instance;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: appController,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Home Page'),
              actions: [CustomSwitch()],
            ),
            body: Container(
              width: double.infinity, //pegando toda a tela
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // eixo y
                crossAxisAlignment: CrossAxisAlignment.center, // eixo x
                children: [
                  Text('Contador: $counter', style: TextStyle(fontSize: 30.0)),
                  CustomSwitch()
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _incrementCounter();
              },
            ),
          );
        });
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
