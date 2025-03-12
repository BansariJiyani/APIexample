import 'package:flutter/foundation.dart';

class ExampleOneProvider with ChangeNotifier {
  double _value = 1.0;

  //get

  double get value => _value;

  //set

  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}
