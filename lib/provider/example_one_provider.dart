import 'package:flutter/foundation.dart';

class ExampleOneProvider with ChangeNotifier {
  double _value = 1.0;
  double get value => _value; // getter method thats why arrow sign =>
  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}
