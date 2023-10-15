import 'package:flutter/material.dart';
import 'package:one_click_flowers/core/app_color.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/src/view/screens/home_screen.dart';
import './product_filter_screen2.dart';
import '../../controller/product_controller.dart';
import '../widgets/product_grid_view_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.title});

  final String? title;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: AppColor.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_rounded,
                  color: AppColor.primary)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder(builder: (ProductController productController) {
          return ProductGridViewWidget(
            items: productController.filteredProducts,
            likeButtonPressed: (index) => productController.isFavorite(index),
            isPriceOff: (product) => productController.isPriceOff(product),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Get.to(()=> FilterScreen());
          // await showModalBottomSheet(
          //   context: context,
          //   isScrollControlled: true,
          //   backgroundColor: Colors.transparent,
          //   shape: const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          //   builder: (context) {
          //     return makeDismissible(
          //       child: DraggableScrollableSheet(
          //         initialChildSize: 0.8,
          //         maxChildSize: 0.8,
          //         minChildSize: 0.5,
          //         builder: (context, controller) {
          //           return Container(
          //             decoration: const BoxDecoration(
          //                 color: AppColor.light,
          //                 borderRadius:
          //                     BorderRadius.vertical(top: Radius.circular(15))),
          //             padding: const EdgeInsets.all(20),
          //             child: Column(
          //               children: [
          //                 Container(
          //                   height: Get.height * 0.5,
          //                   child: GridView.builder(
          //                     itemCount: productController.categories.length,
          //                     gridDelegate:
          //                         const SliverGridDelegateWithFixedCrossAxisCount(
          //                       crossAxisCount: 3,
          //                     ),
          //                     itemBuilder: (BuildContext context, int index) {
          //                       return CheckboxListTile(
          //                         dense: true,
          //                           title: Text(productController
          //                               .categories[index].type.name),
          //                           value: productController
          //                               .categories[index].isSelected,
          //                           onChanged: (bool? value) {
          //                           setState(() {
          //                             productController.categories[index].isSelected = value!;
          //                           });
          //                           });
          //                     },
          //                   ),
          //                 ),
          //                 Container(
          //                   height: Get.height * 0.5,
          //                   child: GridView.builder(
          //                     itemCount: productController.categories.length,
          //                     gridDelegate:
          //                     const SliverGridDelegateWithFixedCrossAxisCount(
          //                       crossAxisCount: 3,
          //                     ),
          //                     itemBuilder: (BuildContext context, int index) {
          //                       return CheckboxListTile(
          //                           dense: true,
          //                           title: Text(productController
          //                               .categories[index].type.name),
          //                           value: productController
          //                               .categories[index].isSelected,
          //                           onChanged: (bool? value) {
          //                             setState(() {
          //                               productController.categories[index].isSelected = value!;
          //                             });
          //                           });
          //                     },
          //                   ),
          //                 )
          //               ],
          //             ),
          //           );
          //         },
          //       ),
          //     );
          //   },
          // );
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
