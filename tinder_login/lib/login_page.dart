import 'package:flutter/material.dart';
import 'package:tinder_login/alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.pinkAccent,
            ),
            _body(),
          ],
        ));
  }

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130,
              child: Image.asset('assets/images/logo.png'),
            ),
            Container(
              height: 35,
            ),
            Text(
              'Location Changer',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 15,
            ),
            Text(
              'Plugin app for Tinder',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 30,
            ),
            Container(
              width: 300,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Alert.dispareAlert('Login', 'Login foi realizado', context);
                      //só mentira, nem foi realizado kkkk
                    },
                    child: Text('Login with Facebook',
                        style: TextStyle(color: Colors.pinkAccent))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
