import 'package:flutter/foundation.dart';


class UserTypeProvider with ChangeNotifier {
  String _userType = "Student";


  

  String get userTypeValue => _userType;

  set userTypeValue(String value) {
    _userType = value;
    notifyListeners();
  }

  void setUserFromModel(){

  }
}
