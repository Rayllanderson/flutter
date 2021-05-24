import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final HomeController controller = HomeController(fromText: fromText, toText: toText);


  test('Deve converter de real para dólar', () {
    toText.text = '2.0';
    controller.convert();
    expect(fromText.text, '0.36');
  });

  test('Deve converter de real para dólar, com vírgula', () {
    toText.text = '2,0';
    controller.convert();
    expect(fromText.text, '0.36');
  });
}
