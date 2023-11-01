import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:one_click_flowers/src/model/product_model.dart';
import './cart_screen.dart';
import '../../controller/product_controller.dart';
import '../widgets/product_grid_view_widget.dart';

import '../widgets/app_drawer.dart';

class FavoriteScreen extends GetView<ProductController> {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    productController.getFavoriteItems();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder(
          builder: (ProductController controller) {
            return ProductGridViewWidget(
              items: controller.productList,
              likeButtonPressed: (index) => controller.isFavorite(index),
              isPriceOff: (product) => controller.isPriceOff(product),
            );
          },
        ),
      ),
    );
  }
}
