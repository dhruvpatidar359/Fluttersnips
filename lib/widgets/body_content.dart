import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class BodyContent extends StatelessWidget {
  final int tabIndex;
  final int gridCrossAxisCount;
  final List<CardModel> data;
  const BodyContent({
    super.key,
    required this.tabIndex,
    required this.gridCrossAxisCount,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<SideBarProvider, SearchProvider>(
      builder: (context, sideBarValue, searchValue, child) {
        List<CardModel> data;

        if (sideBarValue.currentTab == tabIndex && searchValue.query.isEmpty) {
          data = this.data;
        } else {
          data = searchValue.filteredIndex;
        }

        if (searchValue.filteredIndex.isEmpty) {
          return const NoResultsFoundForQuery();
        }
        return ShowCaseContent(crossAxisCount: gridCrossAxisCount, data: data);
      },
    );
  }
}
