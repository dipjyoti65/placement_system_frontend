import 'package:flutter/foundation.dart';
import 'package:placemnet_system_frontend/module/userModels/user.dart';

class UserTypeProvider with ChangeNotifier {
  String _userType = "Student";

  String get userTypeValue => _userType;

  set userTypeValue(String value) {
    _userType = value;
    notifyListeners();
  }


  User _user = User(
    id: '',
    name: '', 
    email: '',
    token:'', 
    password: '', 
    role: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
