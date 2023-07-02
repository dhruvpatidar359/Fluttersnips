import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class SearchProvider extends ChangeNotifier {
  String query = '';
  List<CardModel> searchIndex = [];
  List<CardModel> filteredIndex = [];

  void search() {
    late List<CardModel> results;

    if (query.isNotEmpty) {
      results = searchIndex.where((item) {
        final itemName = item.title.toLowerCase();
        return itemName.contains(query.toLowerCase());
      }).toList();

      updateSearchIndex(results);
    } else {
      resetFilteredIndex();
    }
  }

  void setSearchIndex(List<CardModel> data) {
    searchIndex.clear();
    filteredIndex.clear();
    searchIndex.addAll(data);
    filteredIndex.addAll(data);
  }

  void updateSearchIndex(List<CardModel> data) {
    filteredIndex.clear();
    filteredIndex.addAll(data);
    notifyListeners();
  }

  void resetFilteredIndex() {
    filteredIndex.clear();
    filteredIndex.addAll(searchIndex);
    notifyListeners();
  }
}
