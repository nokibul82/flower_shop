import '../../core/app_color.dart';
import 'package:flutter/material.dart' show Color, Colors;

class ProductBanner {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String? imagePath;

  ProductBanner({
    this.cardBackgroundColor,
    this.buttonTextColor,
    this.buttonBackgroundColor,
    this.imagePath,
  });
}
