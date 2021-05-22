import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier{

  static AppController instance = AppController(); //pra usar apenas uma instancia

  bool isDarkTheme = true;
  changeTheme(){
    isDarkTheme = !isDarkTheme;
    notifyListeners(); //notifica quem estiver escutando
  }
}