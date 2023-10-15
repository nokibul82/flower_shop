import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './src/controller/product_controller.dart';
import './core/app_color.dart';
import './src/controller/bottom_navbar_controller.dart';
import './src/view/screens/cart_screen.dart';
import './src/view/screens/category_screen.dart';
import './src/view/screens/favorite_screen.dart';
import './src/view/screens/home_screen.dart';
import './src/view/widgets/app_bottom_navbar_widget.dart';
import './src/view/widgets/app_drawer.dart';



class OneClickFlowers extends StatelessWidget {
  OneClickFlowers({super.key});


  final navScreens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const CategoryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    final bottomNavbarController = Get.put(BottomNavbarController());
    return GetBuilder<BottomNavbarController>(builder: (context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColor.background,
        drawer: const AppDrawer(),
        body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 800),
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: navScreens[bottomNavbarController.tabIndex]),
        bottomNavigationBar: AppBottomNavbarWidget(),
      );
    });
  }
}
