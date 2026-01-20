import 'package:flutter/cupertino.dart';

class SwitchViewModel extends ChangeNotifier {
  bool _isSwitched = false;
  bool get isSwitched => _isSwitched;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    notifyListeners();
  }
}