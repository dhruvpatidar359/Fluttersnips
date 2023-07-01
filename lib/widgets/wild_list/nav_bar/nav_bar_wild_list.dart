import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return deskTopNavBar(context, "Sign In");
  }
}

Widget deskTopNavBar(BuildContext context, String authText) {
  return Column(
    children: [
      Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            companyLogo(),
            Row(
              children: [
                navButton('SME'),
                navButton('MODELERS'),
                navButton('ABOUTUS'),
                navButton('FEEDBACK'),
                Container(
                  height: 45,
                  margin: const EdgeInsets.only(right: 10.0),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {},
                      icon: const Icon(Icons.login),
                      label: Text(authText)),
                ),
              ],
            ),
          ])),
    ],
  );
}

Widget navButton(String text) {
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {
          // window.alert("dhruv is the best person in the wolrd");
        },
        child: GlowText(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ));
}

Widget companyLogo() {
  return Container(
    margin: const EdgeInsets.only(left: 8),
    child: const Center(
      child: FlutterLogo(
        size: 40.0,
      ),
    ),
  );
}
