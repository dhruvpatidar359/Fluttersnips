import 'package:fluttersnips/shared/exports.dart';

class SearchProvider extends GetxController {
  Rx<String> query = ''.obs;
  var searchIndex = [].obs;
  var filteredIndex = [].obs;

  void search() {
    late List results;

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

  void setSearchIndex(List data) {
    searchIndex.clear();
    filteredIndex.clear();
    searchIndex.addAll(data);
    filteredIndex.addAll(data);
  }

  void updateSearchIndex(List data) {
    filteredIndex.clear();
    filteredIndex.addAll(data);
  }

  void resetFilteredIndex() {
    filteredIndex.clear();
    filteredIndex.addAll(searchIndex);
  }
}
