import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
            itemCount: AppData.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  productController.filterItemsByCategory(index);
                  Get.to(() => ProductsScreen(
                      title: AppData.categories[index].type.name));
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.light,
                        // image: const DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: AssetImage("assets/image/slider/home2-slider1.jpg"),
                        // ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(AppData.categories[index].type.name,
                          style: Theme.of(context).textTheme.displayLarge),
                    )
                  ],
                ),
              );
            }),
      ),
      drawer: const AppDrawer(),
    );
  }
}
