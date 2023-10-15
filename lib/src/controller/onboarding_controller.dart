import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/core/app_page.dart';
import '../view/screens/login_screen.dart';
import '../model/onboarding_model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.off(LoginScreen());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/image/onboarding/On_boarding_screen-1.png', 'Order Your Flower',
        'Now you can order flower any time right from your mobile.'),
    OnboardingInfo('assets/image/onboarding/On_boarding_screen-2.png', 'Delivering The Freshest Flower',
        'We care your time and feeling while picking the best flower for you.'),
    OnboardingInfo('assets/image/onboarding/On_boarding_screen-3.png', 'Send Your Care   With Us',
        'Surprise your loved one and share good feelings')
  ];
}