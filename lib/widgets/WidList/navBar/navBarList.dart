import 'package:flutter/material.dart';

import '../../../Models/cardModel.dart';
import 'navBarWidList.dart';

List<CardModel> navbarListW = [

  CardModel(
    "dhruvpatidar35@gmail.com",
    '''

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {


  @override
  Widget build(BuildContext context) {
    return DeskTopNavBar(context, "Sign In");
  }
}

Widget DeskTopNavBar(BuildContext context, String authText) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        companyLogo(),
        Row(
          children: [
            navButton('SME'),
            navButton('MODELERS'),
            navButton('ABOUTUS'),
            navButton('FEEDBACK'),
            Container(
              height: 45,
              margin: EdgeInsets.only(right: 10.0),
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black)),
                  onPressed: () {
                  
                  },
                  icon: Icon(Icons.login),
                  label: Text(authText)),
            ),
          ],
        ),
      ]));
}

Widget navButton(String text) {
  return Container(

      margin: EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {
          // window.alert("dhruv is the best person in the wolrd");
        },
        child: GlowText(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ));
}

Widget companyLogo() {
  return Container(
  margin: EdgeInsets.only(left: 8),
    child: Center(
      child:   FlutterLogo(size: 40.0,),
    ),
  );
}

''',
    "Navbar",
    NavBar(),
    "Glow NavBar",
  ),


];
