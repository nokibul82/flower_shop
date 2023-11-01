import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/src/controller/category_controller.dart';
import 'package:one_click_flowers/src/view/screens/home_screen.dart';
import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../../one_click_flowers.dart';
import './products_screen.dart';
import '../widgets/app_drawer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    categoryController.getAllCategories();
    categoryController.getAllOccasions();
    categoryController.getAllAddons();
    categoryController.getAllColors();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: Obx(() {
        return categoryController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: AppColor.primary,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: categoryController.categoryList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // controller.filterItemsByCategory(index);
                                    // Get.to(() => ProductsScreen(
                                    //     title: AppData.categories[index].type.name));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.light,
                                      // image: const DecorationImage(
                                      //   fit: BoxFit.cover,
                                      //   image: NetworkImage(""),
                                      // ),
                                    ),
                                    child: Center(
                                      child: Text(
                                          categoryController
                                              .categoryList[index].catName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Text("Occasions",style: Theme.of(context).textTheme.displayMedium,),
                      const SizedBox(height: 5,),
                      Column(
                        children: [
                          GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: categoryController.occasionList.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // controller.filterItemsByCategory(index);
                                    // Get.to(() => ProductsScreen(
                                    //     title: AppData.categories[index].type.name));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.light,
                                      // image: const DecorationImage(
                                      //   fit: BoxFit.cover,
                                      //   image: NetworkImage(""),
                                      // ),
                                    ),
                                    child: Center(
                                      child: Text(
                                          categoryController
                                              .occasionList[index].occasionsName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Text("Addons",style: Theme.of(context).textTheme.displayMedium,),
                      const SizedBox(height: 5,),
                      Column(
                        children: [
                          GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: categoryController.addonList.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // controller.filterItemsByCategory(index);
                                    // Get.to(() => ProductsScreen(
                                    //     title: AppData.categories[index].type.name));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.light,
                                      // image: const DecorationImage(
                                      //   fit: BoxFit.cover,
                                      //   image: NetworkImage(""),
                                      // ),
                                    ),
                                    child: Center(
                                      child: Text(
                                          categoryController
                                              .addonList[index].addonsName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Text("Colors",style: Theme.of(context).textTheme.displayMedium,),
                      const SizedBox(height: 5,),
                      Column(
                        children: [
                          GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: categoryController.colorList.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // controller.filterItemsByCategory(index);
                                    // Get.to(() => ProductsScreen(
                                    //     title: AppData.categories[index].type.name));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.light,
                                      // image: const DecorationImage(
                                      //   fit: BoxFit.cover,
                                      //   image: NetworkImage(""),
                                      // ),
                                    ),
                                    child: Center(
                                      child: Text(
                                          categoryController
                                              .colorList[index].colorName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              );
      }),
      drawer: const AppDrawer(),
    );
  }
}
