import 'package:flutter/material.dart';

class TabIndexProvider extends ChangeNotifier {
  int _tabIndex = 1; // Default tab index

  int get tabIndex => _tabIndex;

  set tabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
