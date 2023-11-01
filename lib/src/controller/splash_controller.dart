import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/one_click_flowers.dart';
import 'package:one_click_flowers/src/view/screens/home_screen.dart';
import 'package:one_click_flowers/src/view/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/screens/onboarding_screen.dart';

import '../../core/app_page.dart';

class SplashController extends GetxController {
  static const String KEYLOGIN = "login";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    whereToGo();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(SplashController.KEYLOGIN);

    Future.delayed(const Duration(seconds: 5), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Get.off(() => OneClickFlowers(), transition: Transition.zoom);
        } else {
          Get.off(() => LoginScreen(), transition: Transition.zoom);
        }
      } else {
        Get.off(() => OnboardingScreen(), transition: Transition.zoom);
      }
    });
  }
}
