import 'package:flutter/material.dart';
import 'package:fluttersnips/widgets/nav_bar/presentation/nav_bar.dart';
import 'package:fluttersnips/widgets/side_bar.dart';

class Showcase extends StatelessWidget {
  final Widget child;
  const Showcase({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: SideBar()),
          Expanded(
            flex: 4,
            child: Stack(children: [child, const NavBar()]),
          ),
        ],
      ),
    );
  }
}
