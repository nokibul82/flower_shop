import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../src/controller/splash_controller.dart';
import '../../../core/app_color.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Image.asset("assets/image/logo/logo_oneclickflower2.png")
              .animate(autoPlay: true)
              .fade(duration: const Duration(seconds: 3))
              .scale(duration: const Duration(seconds: 3), begin: const Offset(0.8,0.8),end: const Offset(1,1)),
        ),
      ),
    );
  }
}
