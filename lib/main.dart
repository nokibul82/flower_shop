import 'dart:ui' show PointerDeviceKind;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/core/app_page.dart';
import 'core/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightAppTheme,
      initialRoute: AppPage.splashScreen,
      getPages: AppPage.bottomNavPages,
    );
  }
}
