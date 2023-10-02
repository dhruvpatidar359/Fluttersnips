import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SideBarProvider extends GetxController {
  Rx<int> currentTab = (-1).obs;

  void setCurrentTab(int value) => currentTab.value = value;

  final List<({String title, IconData iconData})> tabs = [
    (title: 'Recently Added', iconData: Icons.history),
    (title: 'Cards', iconData: Icons.credit_card),
    (title: 'Shapes', iconData: Icons.interests),
    (title: 'Navigation', iconData: Icons.navigation),
    (title: 'WebView', iconData: Icons.web),
    (title: 'Column', iconData: Icons.view_column),
    // (title:'Layout',iconData: Icons.mobile_friendly), # pending to be added
  ];
}
