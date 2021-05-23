import 'package:flutter/material.dart';
import 'package:tinder_login/login_page.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => LoginPage()},
    );
  }
}
