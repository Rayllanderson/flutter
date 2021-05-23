import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  void _doLogin(BuildContext context) {
    if (_email == 'ray@gmail.com' && _password == '123') {
      //push = apenas joga a nova página por cima, poe um botão de voltar no appBar
      //pushReplacement = fazer com que a página atual suma mesmo.
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Erro'),
                content: Text('Login ou senha estão incorretos.'),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop(); //faz sumir
                    },
                  ),
                ]);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          //pegando valor da tela. por que double.infinite nao funcionaria pra SingleChildScrollView
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (email) {
                    _email = email;
                  },
                  keyboardType: TextInputType.emailAddress,
                  //configurando teclado pra ser email
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (password) {
                    _password = password;
                  },
                  obscureText: true, // deixar o campo como senha
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    _doLogin(context);
                  },
                  child: Text('Entrar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
