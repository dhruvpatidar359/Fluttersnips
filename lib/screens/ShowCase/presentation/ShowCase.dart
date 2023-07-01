import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttersnips/Models/cardModel.dart';
import 'package:fluttersnips/screens/ShowCaseContent/presentation/showCaseContent.dart';
import 'package:fluttersnips/services/Datafetch/firebaseRepository.dart';
import 'package:fluttersnips/widgets/NavBar/presentation/NavBar.dart';
import 'package:fluttersnips/widgets/WidList/card/cardList.dart';
import 'package:fluttersnips/widgets/WidList/navBar/navBarList.dart';
import 'package:glassy/glassy_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart' show RiveAnimation;

import '../../../Constants/AppColors.dart';
import '../../../widgets/WidList/shapes/shapeList.dart';

class Showcase extends StatefulWidget {
  const Showcase({Key? key}) : super(key: key);

  @override
  State<Showcase> createState() => _ShowCaseState();
}

class _ShowCaseState extends State<Showcase> {
  int selectedButtonIndex = -1;
  List<CardModel> fetchedData = [];
  List<CardModel> cardList = [];
  List<CardModel> shapeList = [];
  List<CardModel> animatedContainerList = [];
  List<CardModel> navBarList = [];
  List<CardModel> webViewList = [];
  // Add more lists for other button indexes

  String searchQuery = '';

  void _fetchDataFromFirestore() async {
    List<CardModel> list =
        await FirebaseRepository().fetchRecentsFromFirestore();
    setState(() {
      fetchedData = list;
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
      "title": "Shapes",
      "icon": Icons.interests,
      "isSelected": false,
    },
    {
      "title": "NavBar",
      "icon": Icons.navigation,
      "isSelected": false,
    },
    {
      "title": "WebView",
      "icon": Icons.web,
      "isSelected": false,
    },
    {
      "title": "Column",
      "icon": Icons.view_column,
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
        contentWidget = SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  showText(),
                  Container(
                    height: 400,
                    width: 400,
                    child: const RiveAnimation.asset(
                      "assets/birb.riv",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 400,
                      child: GlassyCard(
                          child: Center(
                              child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "How To Use",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "👉 Click on SideBar buttons",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "👉 Look for your choice",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "👉 Copy Code",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "👉 Enjoy",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 300,
                            height: 400,
                            child: GlassyCard(
                                child: Center(
                                    child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "How To Contribute",
                                  style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  "👉 Click on Contribute Button",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "👉 Select Way to Contribute",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "👉 Fluttersnips ,Add Code",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "👉 OR Go For Github",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
        break;
      case 0:
        if (fetchedData.isEmpty) {
          _fetchDataFromFirestore();
          contentWidget = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          contentWidget = showCaseContent(
            crossAxisCount: 2,
            listW: searchQuery.isEmpty
                ? fetchedData
                : searchItems(fetchedData, searchQuery),
          );
        }
        break;
      case 1:
        if (cardList.isEmpty) {
          cardList = cardListW;
        }

        contentWidget = showCaseContent(
          crossAxisCount: 2,
          listW: searchQuery.isEmpty
              ? cardList
              : searchItems(cardList, searchQuery),
        );
        break;

      case 2:
        if (shapeList.isEmpty) {
          shapeList = shapeListW;
        }

        contentWidget = showCaseContent(
          crossAxisCount: 2,
          listW: shapeList,
        );
        break;

      case 3:
        if (navBarList.isEmpty) {
          navBarList = navbarListW;
        }

        contentWidget = showCaseContent(
          crossAxisCount: 1,
          listW: searchQuery.isEmpty
              ? navBarList
              : searchItems(navBarList, searchQuery),
        );
        break;

      case 4:
        if (webViewList.isEmpty) {
          webViewList = [];
        }

        contentWidget = showCaseContent(
          crossAxisCount: 1,
          listW: searchQuery.isEmpty
              ? webViewList
              : searchItems(webViewList, searchQuery),
        );
        break;

      // Add more cases for other button indexes

      default:
        contentWidget = const Center(
            child: SizedBox(
                height: 200,
                width: 200,
                child: RiveAnimation.asset('assets/empty.riv')));
    }

    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              sideBar(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NavBar(
                      onSearch: intermediateSearch,
                    ),
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

  void intermediateSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  List<CardModel> searchItems(List<CardModel> list, String query) {
    if (query.isEmpty) {
      return list;
    }

    return list.where((item) {
      final itemName = item.title.toLowerCase();
      return itemName.contains(query.toLowerCase());
    }).toList();
  }
}
