//Stateless = sem alteração, usado pra coisas estáticas.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';

class AppWidget extends StatelessWidget{
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}