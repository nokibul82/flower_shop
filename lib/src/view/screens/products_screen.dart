import 'package:flutter/material.dart';
import 'package:one_click_flowers/core/app_color.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/one_click_flowers.dart';
import 'package:one_click_flowers/src/controller/bottom_navbar_controller.dart';
import 'package:one_click_flowers/src/view/screens/cart_screen.dart';
import '../../model/product_model.dart';
import './product_filter_screen2.dart';
import '../../controller/search_controller.dart';
import '../widgets/product_grid_view_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen(
      {super.key, required this.title, required this.productList});

  final String? title;
  final List<ProductModel> productList;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  BottomNavbarController bottomNavbarController =
      Get.put(BottomNavbarController());
  String sortValue = "Relevant";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title!,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                          children: [
                            RadioMenuButton(
                                value: "Relevant",
                                groupValue: sortValue,
                                onChanged: (value) {
                                  setState(() {
                                    setState(() {
                                      sortValue = value.toString();
                                      widget.productList.sort(
                                        (a, b) => a.pName.compareTo(widget.title!),
                                      );
                                      Get.back();
                                    });
                                  });
                                },
                                child: const Text("Relevant")),
                            RadioMenuButton(
                                value: "A to Z",
                                groupValue: sortValue,
                                onChanged: (value) {
                                  setState(() {
                                    setState(() {
                                      sortValue = value.toString();
                                      widget.productList.sort(
                                          (a, b) => a.pName.compareTo(b.pName));
                                      Get.back();
                                    });
                                  });
                                },
                                child: const Text("A to Z")),
                            RadioMenuButton(
                                value: "Z to A",
                                groupValue: sortValue,
                                onChanged: (value) {
                                  setState(() {
                                    setState(() {
                                      sortValue = value.toString();
                                      widget.productList.sort(
                                          (b, a) => a.pName.compareTo(b.pName));
                                      Get.back();
                                    });
                                  });
                                },
                                child: const Text("Z to A")),
                            RadioMenuButton(
                                value: "Price: Low to High",
                                groupValue: sortValue,
                                onChanged: (value) {
                                  setState(() {
                                    setState(() {
                                      sortValue = value.toString();
                                      widget.productList.sort((a, b) =>
                                          int.parse(a.pPrice)
                                              .compareTo(int.parse(b.pPrice)));
                                      Get.back();
                                    });
                                  });
                                },
                                child: const Text("Price: Low to High")),
                            RadioMenuButton(
                                value: "Price: High to Low",
                                groupValue: sortValue,
                                onChanged: (value) {
                                  setState(() {
                                    setState(() {
                                      sortValue = value.toString();
                                      widget.productList.sort((b, a) =>
                                          int.parse(a.pPrice)
                                              .compareTo(int.parse(b.pPrice)));
                                      Get.back();
                                    });
                                  });
                                },
                                child: const Text("Price: High to Low")),
                          ],
                        ));
              },
              icon: const Icon(Icons.sort)),
          IconButton(
              onPressed: () {
                //bottomNavbarController.changeTabIndex(2);
                Get.to(CartScreen());
              },
              icon: const Icon(Icons.shopping_cart_rounded,
                  color: AppColor.primary)),
        ],
      ),
      body: Obx(() {
        return Get.put(SearchProductController()).isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: AppColor.primary,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GetBuilder(
                    builder: (SearchProductController searchController) {
                  return ProductGridViewWidget(
                    items: widget.productList,
                    likeButtonPressed: (index) =>
                        searchController.isFavorite(index),
                    isPriceOff: (product) =>
                        searchController.isPriceOff(product),
                  );
                }),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Get.to(() => FilterScreen());
        },
        backgroundColor: AppColor.primary,
        child: const Icon(Icons.filter_alt_rounded),
      ),
    );
  }

  Widget makeDismissible({required DraggableScrollableSheet child}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Get.back(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
}
