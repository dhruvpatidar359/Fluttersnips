import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: TextField(
        textAlign: TextAlign.center,
        controller: _searchController,
        style: GoogleFonts.poppins(fontSize: 15),
        onChanged: (value) {
          searchProvider.query.value = value;
          initiateSearch();
        },
        decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          fillColor: const Color(0xFF202020),
          hintText: 'Search',
          hintStyle: GoogleFonts.poppins(
            fontSize: 15,
            color: const Color(0xFF838383),
          ),

          // search icon
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Icon(CupertinoIcons.search, size: 18),
          ),

          // clear button/icon
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              iconSize: 18,
              icon: const Icon(Icons.clear),
              onPressed: () => _searchController.clear(),
            ),
          ),
        ),
      ),
    );
  }

  void initiateSearch() => searchProvider.search();
}
