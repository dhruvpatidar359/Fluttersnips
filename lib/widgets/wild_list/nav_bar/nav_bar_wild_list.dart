import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class Navbar0 extends StatefulWidget {
  const Navbar0({Key? key}) : super(key: key);

  @override
  State<Navbar0> createState() => _Navbar0State();
}

class _Navbar0State extends State<Navbar0> {
  @override
  Widget build(BuildContext context) {
    return deskTopNavBar(context, "Sign In");
  }
}

Widget deskTopNavBar(BuildContext context, String authText) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              margin: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {},
                  icon: const Icon(Icons.login),
                  label: Text(authText)),
            ),
          ],
        ),
      ]));
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

class Navbar1 extends StatelessWidget {
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

class Navbar2 extends StatelessWidget {
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

class Navbar3 extends StatelessWidget {
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

class Navbar4 extends StatefulWidget {
  @override
  _Navbar4State createState() => _Navbar4State();
}

class _Navbar4State extends State<Navbar4> {
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
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
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
                    title: Text('Favorites',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.history, color: Colors.white),
                    title:
                        Text('History', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text('App Settings',
                        style: TextStyle(color: Colors.white)),
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


