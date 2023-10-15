import './product.dart';
import 'package:flutter/material.dart' show IconData;

class ProductCategory {
  ProductType type;
  bool isSelected;

  ProductCategory(this.type, this.isSelected);
}
