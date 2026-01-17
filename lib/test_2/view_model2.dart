import 'package:flutter/cupertino.dart';

class ViewModel2 extends ChangeNotifier{
  double _value = 1.0;
  double get value => _value;

  void setValue(val){
    _value = val;
    notifyListeners();
  }
}