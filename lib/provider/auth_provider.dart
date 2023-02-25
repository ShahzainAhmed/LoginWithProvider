// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading; // getter method/function

  setLoading(bool value) {
    _loading = value;
    notifyListeners(); // notify after setting the value
  }

  void login(String email, String password) async {
    // loading value will be changed to true, which was set to false initially
    setLoading(true);

    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        print("Successfull");
        setLoading(false);
      } else {
        setLoading(false);
        print("Failed");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}
