import 'package:flutter/material.dart';

class CurrencyModel {
  final CurrencyName currencyName;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  CurrencyModel({this.currencyName, this.real, this.dolar, this.euro, this.bitcoin});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
          currencyName: CurrencyName.real, real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016),
      CurrencyModel(
          currencyName: CurrencyName.dolar, real: 5.63, dolar: 1.0, euro: 0.85, bitcoin: 0.000088),
      CurrencyModel(
          currencyName: CurrencyName.euro, real: 6.62, dolar: 1.17, euro: 1.0, bitcoin: 0.00010),
      CurrencyModel(
          currencyName: CurrencyName.bitcoin,
          real: 64116.51,
          dolar: 11351.30,
          euro: 9689.34,
          bitcoin: 1.0),
    ];
  }
}

enum CurrencyName{
  real, dolar, euro, bitcoin
}

extension CurrencyNameExtension on CurrencyName{
  String get name {
    switch(this){
      case CurrencyName.real:
        return 'Real';
      case CurrencyName.dolar:
        return 'Dólar';
      case CurrencyName.euro:
        return 'Euro';
      case CurrencyName.bitcoin:
        return 'Bitcoin';
      default:
        return '';
    }
  }
}
