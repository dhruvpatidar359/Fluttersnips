import 'package:flutter/material.dart';

class SideBarProvider extends ChangeNotifier {
  int currentTab = -1;

  void setCurrentTab(int value) {
    currentTab = value;
    notifyListeners();
  }
}
