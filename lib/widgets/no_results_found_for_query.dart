import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class NoResultsFoundForQuery extends StatelessWidget {
  const NoResultsFoundForQuery({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        return Text(
          "No results found for '${searchProvider.query}'",
          style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
        );
      }),
    );
  }
}
