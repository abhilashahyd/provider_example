import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  bool _isAuth = false;

  bool get isAuth {
    return _isAuth;
  }

  Future<void> authenticate(String username, String password) async {
    print('authenticate');
    print(username);
    print(password);
    if (username == 'user1@gmail.com' && password == '1234') {
      _isAuth = true;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isAuth = false;
    notifyListeners();
  }
}
