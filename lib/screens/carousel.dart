import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';
import 'package:fluttersnips/widgets/wild_list/carousels/carousel_list.dart';

class Carousel extends BodyContent {
  const Carousel({super.key})
      : super(tabIndex: 1, gridCrossAxisCount: 2, data: carouselListW);
}
