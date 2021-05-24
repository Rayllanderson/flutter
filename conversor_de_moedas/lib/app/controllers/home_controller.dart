import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<CurrencyModel> currencies;
  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue;

    switch (fromCurrency.name) {
      case CurrencyName.real:
        returnValue = value * toCurrency.real;
        break;
      case CurrencyName.dolar:
        returnValue = value * toCurrency.dolar;
        break;
      case CurrencyName.euro:
        returnValue = value * toCurrency.euro;
        break;
      case CurrencyName.bitcoin:
        returnValue = value * toCurrency.bitcoin;
        break;
      default:
        returnValue = value;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
