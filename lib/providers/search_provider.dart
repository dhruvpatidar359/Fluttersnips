import 'package:fluttersnips/shared/exports.dart';

class SearchProvider extends GetxController {
  RxString query = ''.obs; 
  RxList<Map<String, dynamic>> searchIndex = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredIndex = <Map<String, dynamic>>[].obs;

  void search() {
    List<Map<String, dynamic>> results;

    if (query.value.isNotEmpty) {
      results = searchIndex.where((item) {
        final itemName = (item['title'] as String).toLowerCase();
        return itemName.contains(query.value.toLowerCase());
      }).toList();

      updateSearchIndex(results);
    } else {
      resetFilteredIndex();
    }
  }

  void setSearchIndex(List<Map<String, dynamic>> data) {
    searchIndex.clear();
    filteredIndex.clear();
    searchIndex.addAll(data);
    filteredIndex.addAll(data);
  }

  void updateSearchIndex(List<Map<String, dynamic>> data) {
    filteredIndex.clear();
    filteredIndex.addAll(data);
  }

  void resetFilteredIndex() {
    filteredIndex.clear();
    filteredIndex.addAll(searchIndex);
  }
}
