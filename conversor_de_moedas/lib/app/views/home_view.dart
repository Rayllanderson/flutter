import 'package:conversor_de_moedas/app/components/currency_box.dart';
import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  HomeController homeController;

  @override
  void initState() { //chamado quando é iniciado o construtor, like useEffect do react
    super.initState();
    homeController = HomeController(fromText: fromText, toText: toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
                CurrencyBox(
                  textEdit: toText,
                  selectedItem: homeController.toCurrency,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CurrencyBox(
                  textEdit: fromText,
                  selectedItem: homeController.fromCurrency,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    ),
                    onPressed: () {
                      homeController.convert();
                    },
                    child:
                        Text('CONVERTER', style: TextStyle(color: Colors.black)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
