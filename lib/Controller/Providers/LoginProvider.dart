import 'package:flutter/widgets.dart';

class LoginProvider extends ChangeNotifier{
  bool clicked = false;
  void change()
  {
    clicked = !clicked;
    notifyListeners();
  }

}