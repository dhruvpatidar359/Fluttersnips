import 'package:flutter/material.dart';
import 'package:fluttersnips/router.dart';
import 'package:fluttersnips/shared/exports.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

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
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: sideBarProvider.tabs.length,
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final tab = sideBarProvider.tabs[index];
                return Obx(() {
                  return SideMenuTile(
                    title: tab.title,
                    iconData: tab.iconData,
                    isSelected: sideBarProvider.currentTab.value == index,
                    onTap: () {
                      sideBarProvider.setCurrentTab(index);
                      Utils.updateSearchIndex(index);
                      router.goNamed(
                        tab.title.toLowerCase().replaceAll(' ', '-'),
                      );
                    },
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
