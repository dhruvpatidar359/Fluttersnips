import 'package:fluttersnips/shared/exports.dart';
import 'package:fluttersnips/widgets/wild_list/card/card_list.dart';
import 'package:fluttersnips/widgets/wild_list/nav_bar/nav_bar_list.dart';
import 'package:fluttersnips/widgets/wild_list/shapes/shape_list.dart';

class Utils {
  static void updateSearchIndex(int tab) {
    switch (tab) {
      case 1:
        searchProvider.setSearchIndex(cardListW);
        break;
      case 2:
        searchProvider.setSearchIndex(shapeListW);
        break;
      case 3:
        searchProvider.setSearchIndex(navbarListW);
        break;
      default:
    }
  }
}
