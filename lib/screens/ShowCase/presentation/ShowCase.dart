import 'package:flutter/material.dart';
import 'package:fluttersnips/Models/cardModel.dart';
import 'package:fluttersnips/screens/ShowCaseContent/presentation/showCaseContent.dart';
import 'package:fluttersnips/services/Datafetch/firebaseRepository.dart';
import 'package:fluttersnips/shared/exports.dart';
import 'package:fluttersnips/widgets/NavBar/presentation/NavBar.dart';
import 'package:fluttersnips/widgets/WidList/card/cardList.dart';
import 'package:fluttersnips/widgets/WidList/navBar/navBarList.dart';
import 'package:glassy/glassy_card.dart';
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

  late String searchQuery;

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
      "title": "Cards",
      "icon": Icons.credit_card,
      "isSelected": false,
    },
    {
      "title": "Shapes",
      "icon": Icons.interests,
      "isSelected": false,
    },
    {
      "title": "Navigation",
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
    searchQuery = context.watch<SearchProvider>().query;
    return Scaffold(body: home());
  }

  Widget showText() {
    return SizedBox(
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
    );
  }

  Widget home() {
    Widget contentWidget = Container();

    switch (selectedButtonIndex) {
      case -1:
        contentWidget = SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 110, 40, 30),
                child: Row(
                  children: [
                    showText(),
                    const SizedBox(
                      height: 400,
                      width: 400,
                      child: RiveAnimation.asset(
                        "assets/birb.riv",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
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
              )
            ],
          ),
        );
        break;

      // Recently Added
      case 0:
        if (fetchedData.isEmpty) {
          _fetchDataFromFirestore();
          contentWidget = const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          contentWidget = ShowCaseContent(
            crossAxisCount: 2,
            data: searchQuery.isEmpty
                ? fetchedData
                : searchItems(fetchedData, searchQuery),
          );
        }
        break;

      // Cards
      case 1:
        if (cardList.isEmpty) {
          cardList = cardListW;
        }

        contentWidget = ShowCaseContent(
          crossAxisCount: 2,
          data: searchQuery.isEmpty
              ? cardList
              : searchItems(cardList, searchQuery),
        );
        break;

      // Shapes
      case 2:
        if (shapeList.isEmpty) {
          shapeList = shapeListW;
        }

        contentWidget = ShowCaseContent(
          crossAxisCount: 2,
          data: shapeList,
        );
        break;

      // Navigation
      case 3:
        if (navBarList.isEmpty) {
          navBarList = navbarListW;
        }

        contentWidget = ShowCaseContent(
          crossAxisCount: 1,
          data: searchQuery.isEmpty
              ? navBarList
              : searchItems(navBarList, searchQuery),
        );
        break;

      // Webview
      case 4:
        if (webViewList.isEmpty) {
          webViewList = [];
        }

        contentWidget = ShowCaseContent(
          crossAxisCount: 1,
          data: searchQuery.isEmpty
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
            child: RiveAnimation.asset('assets/empty.riv'),
          ),
        );
    }

    return Row(
      children: [
        Expanded(child: sideBar()),
        Expanded(
          flex: 4,
          child: Stack(children: [contentWidget, const NavBar()]),
        ),
      ],
    );
  }

  Widget sideBar() {
    return Container(
      color: const Color(0xFF101010),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Flutter Snips.',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: Colors.grey, thickness: 0.2),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 4);
              },
              itemBuilder: (context, index) {
                final item = items[index];
                return SideMenuTile(
                  title: item['title'],
                  iconData: item['icon'],
                  isSelected: selectedButtonIndex == index,
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
        ],
      ),
    );
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

class SideMenuTile extends StatefulWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  final bool isSelected;
  const SideMenuTile(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap,
      required this.isSelected});

  @override
  State<SideMenuTile> createState() => _SideMenuTileState();
}

class _SideMenuTileState extends State<SideMenuTile> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() => hovering = true),
        onExit: (event) => setState(() => hovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          decoration: BoxDecoration(
            color: hovering
                ? Colors.grey[900]
                : widget.isSelected
                    ? Colors.grey[900]
                    : Colors.transparent,
            borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(100)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.iconData,
                color: widget.isSelected ? primaryColor : Colors.white,
              ),
              const SizedBox(width: 14),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: widget.isSelected ? primaryColor : Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
