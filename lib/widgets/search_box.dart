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

  late final SearchProvider searchProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: TextField(
        textAlign: TextAlign.center,
        controller: _searchController,
        style: GoogleFonts.poppins(fontSize: 15),
        onChanged: (value) {
          searchProvider.query = value.trim();
        },
        decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          fillColor: const Color(0xFF202020),
          hintText: 'Search',
          hintStyle: GoogleFonts.poppins(
            color: const Color(0xFF838383),
            fontSize: 15,
          ),

          // Add a clear button to the search bar
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: IconButton(
              iconSize: 18,
              icon: const Icon(Icons.clear),
              onPressed: () => _searchController.clear(),
            ),
          ),

          // Add a search icon or button to the search bar
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: IconButton(
              iconSize: 18,
              icon: const Icon(CupertinoIcons.search),
              onPressed: () {
                handleSearch(_searchController.text);
              },
            ),
          ),
        ),
      ),
    );
  }

  void handleSearch(String query) {
    // widget.onSearch(query);
  }
}
