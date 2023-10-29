import 'package:flutter/material.dart';
import 'package:fluttersnips/screens/cards.dart';
import 'package:fluttersnips/screens/carousel.dart';
import 'package:fluttersnips/screens/columns.dart';
import 'package:fluttersnips/screens/intro_page.dart';
import 'package:fluttersnips/screens/layouts.dart';
import 'package:fluttersnips/screens/navigation.dart';
import 'package:fluttersnips/screens/recently_added.dart';
import 'package:fluttersnips/screens/shapes.dart';
import 'package:fluttersnips/screens/web_view.dart';
import 'package:fluttersnips/shared/exports.dart';
import 'package:fluttersnips/widgets/nav_bar/presentation/nav_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // body
        Consumer<SideBarProvider>(
          builder: (context, value, child) {
            switch (value.currentTab) {
              case 0:
                return const RecentlyAdded();

              // ignore: constant_pattern_never_matches_value_type
              case 1:
                return const Cards();

              case 2:
                return const Shapes();

              case 3:
                return Navigation();

              case 4:
                return const WebView();

              case 5:
                return const Columns();

              case 6:
                return const Buttons();

              case 7:
                return const Layouts();

              case 8:
                return const Carousel();

              default:
                return const IntroPage();
            }
          },
        ),

        // header
        const NavBar(),
      ],
    );
  }
}
