
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Stateful = Com alteração, coisas que amos modificar.
class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}


class HomePageState extends State<HomePage> {

  int counter = 0;

  void _incrementCounter(){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: GestureDetector(child: Text('Contador: $counter',
        style: TextStyle(fontSize: 30.0)),
          onTap: () {
            _incrementCounter();
        },),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _incrementCounter();
        },
      ),
    );
  }
}