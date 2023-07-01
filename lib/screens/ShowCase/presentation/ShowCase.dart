import 'package:flutter/material.dart';
import 'package:fluttersnips/widgets/main_view.dart';
import 'package:fluttersnips/widgets/side_bar.dart';

class Showcase extends StatelessWidget {
  const Showcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(child: SideBar()),
          Expanded(flex: 4, child: MainView()),
        ],
      ),
    );
  }
}
