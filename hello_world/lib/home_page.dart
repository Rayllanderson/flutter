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
            ),
            body: Center(
                child: GestureDetector(
              child: Switch(
                value: appController.isDarkTheme,
                onChanged: (value) {
                  appController.changeTheme();
                },
              ),
            )),
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
