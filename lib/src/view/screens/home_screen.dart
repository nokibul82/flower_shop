import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:one_click_flowers/src/view/screens/search_screen.dart';
import '../../controller/bottom_navbar_controller.dart';
import '../../../one_click_flowers.dart';
import '../widgets/app_drawer.dart';
import '../../../core/app_data.dart';
import '../../../core/app_color.dart';
import '../../controller/product_controller.dart';
import '../widgets/list_item_selector.dart';
import '../widgets/product_listview_widget.dart';

final ProductController controller = Get.put(ProductController());
final BottomNavbarController navbarController =
    Get.put(BottomNavbarController());

class HomeScreen extends GetView<ProductController> {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _sectionHeader(
      BuildContext context, String title, Function onclickFunction) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
            onPressed: () {
              onclickFunction();
            },
            style: TextButton.styleFrom(foregroundColor: AppColor.primary),
            child: Text(
              "SEE ALL",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: AppColor.primary.withOpacity(0.7)),
            ),
          )
        ],
      ),
    );
  }

  Widget _topCategoriesListView() {
    return ListItemSelector(
      categories: controller.categories,
      onItemPressed: (index) {
        controller.filterItemsByCategory(index);
      },
    );
  }

  Widget _slider(BuildContext context) {
    return CarouselSlider(
      items: AppData.sliderProducts,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.19,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getAllItems();
    return Scaffold(
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
            onPressed: () {
              controller.getAllProducts();
              Get.to(() => const SearchScreen());
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: AppColor.primary,
                ),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Sina",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          "Lets get some flowers?",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _slider(context),
                        _sectionHeader(context, "Categories", () {
                          navbarController.changeTabIndex(3);
                          Get.to(() => OneClickFlowers());
                        }),
                        _topCategoriesListView(),
                        const SizedBox(
                          height: 10,
                        ),
                        //_sectionHeader(context, "Best Selling", () {}),
                        GetBuilder(builder: (ProductController controller) {
                          return ProductListViewWidget(
                            items: controller.productList,
                            likeButtonPressed: (index) =>
                                controller.isFavorite(index),
                            isPriceOff: (product) =>
                                controller.isPriceOff(product),
                          );
                        }),
                        _sectionHeader(context, "Best Selling", () {}),
                        GetBuilder(builder: (ProductController controller) {
                          return ProductListViewWidget(
                            items: controller.productList,
                            likeButtonPressed: (index) =>
                                controller.isFavorite(index),
                            isPriceOff: (product) =>
                                controller.isPriceOff(product),
                          );
                        }),
                        _sectionHeader(context, "Add Ons", () {}),
                        GetBuilder(builder: (ProductController controller) {
                          return ProductListViewWidget(
                            items: controller.productList,
                            likeButtonPressed: (index) =>
                                controller.isFavorite(index),
                            isPriceOff: (product) =>
                                controller.isPriceOff(product),
                          );
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        _slider(context),
                        // GetBuilder(builder: (ProductController controller) {
                        //   return ProductGridViewWidget(
                        //     items: controller.filteredProducts,
                        //     likeButtonPressed: (index) => controller.isFavorite(index),
                        //     isPriceOff: (product) => controller.isPriceOff(product),
                        //   );
                        // }),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
