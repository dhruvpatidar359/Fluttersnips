import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class BodyContent extends StatelessWidget {
  final int tabIndex;
  final int gridCrossAxisCount;
  final List data;
  const BodyContent({
    super.key,
    required this.tabIndex,
    required this.gridCrossAxisCount,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List data;

      if (sideBarProvider.currentTab.value == tabIndex &&
          searchProvider.query.isEmpty) {
        data = this.data;
      } else {
        data = searchProvider.filteredIndex;
      }

      if (searchProvider.filteredIndex.isEmpty) {
        return const NoResultsFoundForQuery();
      }

      return ShowCaseContent(crossAxisCount: gridCrossAxisCount, data: data);
    });
  }
}
