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
            drawer: Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                      currentAccountPicture: Image.network('https://avatars.githubusercontent.com/u/63964369?v=4'),
                      accountName: Text('Rayllanderson'),
                      accountEmail: Text('ray@gmail.com')),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Inicio'),
                    subtitle: Text('Tela de início'),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    subtitle: Text('Sair do aplicativo'),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                  )
                ],
              ),
            ),
            body: Container(
              width: double.infinity, //pegando toda a tela
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // eixo y
                crossAxisAlignment: CrossAxisAlignment.center, // eixo x
                children: [
                  Text('Contador: $counter', style: TextStyle(fontSize: 30.0)),
                  CustomSwitch(),
                  Container(
                    //usando pra aumentar a altura entre os elementos, tipo margin-top
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //desenhando quadrados...
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                      )
                    ],
                  )
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
