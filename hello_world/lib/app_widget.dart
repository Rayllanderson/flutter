//Stateless = sem alteração, usado pra coisas estáticas.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/app_controller.dart';
import 'package:hello_world/home_page.dart';
import 'package:hello_world/login_page.dart';
import 'package:hello_world/themes/Themes.dart';

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appController = AppController.instance;
    return AnimatedBuilder(
      animation: appController,
      builder: (context, child) {
        return MaterialApp(
          title: title,
          theme: appController.isDarkTheme ? Themes.darkTheme() : Themes.lightTheme(),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginPage(),
            '/home': (context) => HomePage()
          },
        );
      },
    );
  }
}
