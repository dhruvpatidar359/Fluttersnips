import 'package:flutter/material.dart';
import 'package:fluttersnips/Models/cardModel.dart';
import 'package:fluttersnips/screens/ShowCaseContent/presentation/showCaseContent.dart';
import 'package:fluttersnips/services/Datafetch/firebaseRepository.dart';
import 'package:fluttersnips/widgets/NavBar/presentation/NavBar.dart';
import 'package:fluttersnips/widgets/WidList/Widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart' show RiveAnimation;

import '../../../Constants/AppColors.dart';
import '../../../widgets/cardTest.dart';

class Showcase extends StatefulWidget {
  const Showcase({Key? key}) : super(key: key);

  @override
  State<Showcase> createState() => _ShowCaseState();
}




class _ShowCaseState extends State<Showcase> {
  int selectedButtonIndex = -1;
   List<CardModel> fetchedData = [];



void _fetchDataFromFirestore() async {
    List<CardModel> list = await FirebaseRepository().fetchRecentsFromFirestore();
    setState(() {
      fetchedData = list; // Update the fetchedData variable with the fetched data
    });
  }

  final List<Map<String, dynamic>> items = [
    {
      "title": "Recently Added",
      "icon": Icons.history,
      "isSelected": false,
    },
    {
      "title": "Card",
      "icon": Icons.credit_card,
      "isSelected": false,
    },
    {
      "title": "Animated Container",
      "icon": Icons.animation,
      "isSelected": false,
    },
    {
      "title": "Appbar",
      "icon": Icons.rectangle,
      "isSelected": false,
    },
    {
      "title": "Column",
      "icon": Icons.view_column,
      "isSelected": false,
    },
    {
      "title": "Lines",
      "icon": Icons.linear_scale_sharp,
      "isSelected": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home(),
    );
  }

  Widget showText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                'Code for faster development',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Flexible(
              child: Text(
                'Flutter Snips.',
                style: GoogleFonts.alfaSlabOne(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Flexible(
              child: Text(
                'By Dhruv Patidar',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget home() {
    Widget contentWidget = Container();

   

    switch (selectedButtonIndex) {
      case -1:
        contentWidget = Row(
          children: [
            showText(),
            Container(
              height: 400,
              width: 400,
              child: const RiveAnimation.asset(
                "assets/birb.riv",
              ),
            )
          ],
        );
        break;
           case 0:
        if (fetchedData.isEmpty) {
          _fetchDataFromFirestore(); // Call the function to fetch data if it hasn't been fetched yet
          contentWidget = Center(child: Container(child: CircularProgressIndicator())); // Display a loading indicator while fetching data
        } else {
          contentWidget = showCaseContent(listW: fetchedData); // Display the fetched data
        }
        break;

      case 1:
        List<CardModel> list = [
          CardModel('dhruvpatidar35@gmail.com', "lkjdlfkgn", 'card',
              ModuleCard(), 'Tilt')
        ];

        contentWidget = showCaseContent(
          listW: list,
        );
        break;
      // Add more cases for other button indexes
      default:
        contentWidget = SizedBox();
    }

    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              sideBar(),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NavBar(),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(child: contentWidget),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget sideBar() {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF101010), Color(0xFF101010)])),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Flutter Snips.",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy_rounded,
                    color: primaryColor,
                  )),
            ]),
            const SizedBox(
              height: 20,
            ),
            Text("Widgets",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 6,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      items[index]['icon'],
                      color: selectedButtonIndex == index
                          ? primaryColor
                          : Colors.white,
                    ),
                    title: Text(items[index]['title'],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: selectedButtonIndex == index
                              ? primaryColor
                              : Colors.white,
                        )),
                    onTap: () {
                      setState(() {
                        selectedButtonIndex = index;
                        if (selectedButtonIndex == 0) {
                            _fetchDataFromFirestore();
                          }
                      });
                    },
                  );
                },
              ),
            )
          ]),
        ],
      ),
    );
  }
}

Widget codeBtn() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
    child: Container(
      // Increase the button height as desired
      height: 45,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Decrease the border radius
            ),
          ),
        ),
        onPressed: () {},
        icon: Icon(Icons.code, color: Colors.white),
        label: Text(
          'Code',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
