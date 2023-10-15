import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/src/controller/bottom_navbar_controller.dart';
import 'package:one_click_flowers/src/view/screens/home_screen.dart';

import '../../../core/app_color.dart';

class AppBottomNavbarWidget extends StatelessWidget {
  AppBottomNavbarWidget({super.key});
  BottomNavbarController bottomNavbarController = Get.put(BottomNavbarController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.1,
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              bottomNavbarController.changeTabIndex(0);
            },
            icon: bottomNavbarController.tabIndex == 0
                ? const Icon(
              Icons.home_rounded,
              color: AppColor.primary,
              size: 35,
            )
                : const Icon(
              Icons.home_outlined,
              color: AppColor.secondary,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              bottomNavbarController.changeTabIndex(1);
            },
            icon: bottomNavbarController.tabIndex == 1
                ? const Icon(
              Icons.favorite_rounded,
              color: AppColor.primary,
              size: 35,
            )
                : const Icon(
              Icons.favorite_border_rounded,
              color: AppColor.secondary,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              bottomNavbarController.changeTabIndex(2);
            },
            icon: bottomNavbarController.tabIndex == 2
                ? const Icon(
              Icons.shopping_cart_rounded,
              color: AppColor.primary,
              size: 35,
            )
                : const Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.secondary,
              size: 25,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              bottomNavbarController.changeTabIndex(3);
            },
            icon: bottomNavbarController.tabIndex == 3
                ? const Icon(
              Icons.category_rounded,
              color: AppColor.primary,
              size: 35,
            )
                : const Icon(
              Icons.category_outlined,
              color: AppColor.secondary,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
