import 'package:conversor_de_moedas/app/components/currency_box.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 30, right: 30),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', width: 150, height: 150),
              SizedBox(
                height: 50,
              ),
              CurrencyBox(),
              SizedBox(
                height: 10,
              ),
              CurrencyBox(),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                  onPressed: () {},
                  child:
                      Text('CONVERTER', style: TextStyle(color: Colors.black)))
            ],
          ),
        ),
      ),
    );
  }
}
