import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      //PushNamed = apenas joga a nova página por cima, poe um botão de voltar no appBar
      //pushReplacementNamed = fazer com que a página atual suma mesmo.
      Navigator.of(context).pushReplacementNamed('/home');
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

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        //pegando valor da tela. por que double.infinite nao funcionaria pra SingleChildScrollView
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Image.asset('assets/imagens/logo.png'),
              ),

              SizedBox(height: 20),

              Card(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
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
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _doLogin(context);
                          },
                          child: Text('Entrar', style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(color: Colors.blue), // pela ordem, o de cima, fica embaixo
            _body(), // esse ficará em cima
          ],
        )
    );
  }
}
