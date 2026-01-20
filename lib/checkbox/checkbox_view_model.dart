import 'package:flutter/cupertino.dart';

class CheckboxViewModel extends ChangeNotifier{
  bool _isChecked = false;
  bool get isChecked => _isChecked;

  void toggleChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }
}