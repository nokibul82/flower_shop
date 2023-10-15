import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../view/screens/onboarding_screen.dart';

import '../../core/app_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 5), () {
      Get.off(()=> OnboardingScreen(),transition: Transition.zoom);
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
