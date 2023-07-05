
import '../../../models/card_model.dart';
import 'nav_bar_wild_list.dart';

List<CardModel> navbarListW = [
  const CardModel(
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
    Navbar0(),
    "Glow NavBar",
  ),
  const CardModel(
    "avinashjindal7866@gmail.com",
    '''
import 'package:flutter/material.dart';

class NavbarWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'About',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Services',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Contact',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
      ''',
    "Navbar 1",
    Navbar1(),
    "Simple navigation bar with red background",
  ),
  const CardModel(
    "avinashjindal7866@gmail.com",
    '''
import 'package:flutter/material.dart';

class NavbarWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Products',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Blog',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Contact',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
      ''',
    "Navbar 2",
    Navbar2(),
    "Navigation bar with a menu icon and blue background",
  ),
  const CardModel(
    "avinashjindal7866@gmail.com",
    '''
import 'package:flutter/material.dart';

class NavbarWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Features',
            style: TextStyle(color: Colors.white),
          ),
          DropdownButton<String>(
            items: ['Option 1', 'Option 2', 'Option 3']
                .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (value) {},
            underline: Container(),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            style: TextStyle(color: Colors.white),
            hint: Text(
              'Select',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(
            'Contact',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
      ''',
    "Navbar 4",
    Navbar3(),
    "Navigation bar with dropdown button and orange background",
  ),
  const CardModel(
      'dhruvpatidar35@gmail.com',
      '''
class NavbarWidget extends StatefulWidget {
  @override
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  bool isNavbarExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isNavbarExpanded = !isNavbarExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,0,4),
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Settings'),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
          if (isNavbarExpanded) ...[
            Divider(
              color: Colors.white.withOpacity(0.3),
              thickness: 2.0,
              height: 0.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Options',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.white),
                    title: Text('Favorites', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.history, color: Colors.white),
                    title: Text('History', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text('App Settings', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}




''',
      'NavBar',
      Navbar4(),
      'Navbar with Search|Profile|Onclick Profile')
];
