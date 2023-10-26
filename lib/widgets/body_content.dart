import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class BodyContent extends StatelessWidget {
  final int tabIndex;
  final int gridCrossAxisCount;
  final List data;

  const BodyContent({
    Key? key,
    required this.tabIndex,
    required this.gridCrossAxisCount,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentData = (sideBarProvider.currentTab.value == tabIndex && searchProvider.query.isEmpty)
          ? data
          : searchProvider.filteredIndex;

      if (currentData.isEmpty) {
        return const NoResultsFoundForQuery();
      }

      return ShowCaseContent(crossAxisCount: gridCrossAxisCount, data: currentData);
    });
  }
}
