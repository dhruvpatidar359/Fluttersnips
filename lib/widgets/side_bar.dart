import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';
import 'package:fluttersnips/widgets/wild_list/card/card_list.dart';
import 'package:fluttersnips/widgets/wild_list/nav_bar/nav_bar_list.dart';
import 'package:fluttersnips/widgets/wild_list/shapes/shape_list.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final List<({String title, IconData iconData})> items = [
    (title: "Recently Added", iconData: Icons.history),
    (title: "Cards", iconData: Icons.credit_card),
    (title: "Shapes", iconData: Icons.interests),
    (title: "Navigation", iconData: Icons.navigation),
    (title: "WebView", iconData: Icons.web),
    (title: "Column", iconData: Icons.view_column),
  ];

  late SearchProvider searchProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
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
                return Consumer<SideBarProvider>(
                  builder: (context, value, child) {
                    return SideMenuTile(
                      title: item.title,
                      iconData: item.iconData,
                      isSelected: value.currentTab == index,
                      onTap: () {
                        value.setCurrentTab(index);
                        updateSearchIndex(index);
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void updateSearchIndex(int tab) {
    switch (tab) {
      case 1:
        searchProvider.setSearchIndex(cardListW);
        break;
      case 2:
        searchProvider.setSearchIndex(shapeListW);
        break;
      case 3:
        searchProvider.setSearchIndex(navbarListW);
        break;
      default:
    }
  }
}
