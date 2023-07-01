import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class NoResultsFoundForQuery extends StatelessWidget {
  const NoResultsFoundForQuery({super.key});

  @override
  Widget build(BuildContext context) {
    final query = context.watch<SearchProvider>().query;

    return Center(
      child: Text(
        "No results found for '$query'",
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.grey),
      ),
    );
  }
}
