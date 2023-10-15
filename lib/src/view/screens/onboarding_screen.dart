import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:one_click_flowers/core/app_color.dart';
import '../../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  final _controller = OnboardingController();

  OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            _controller.onboardingPages[index].imageAsset,fit: BoxFit.cover,),
                        SizedBox(height: 32),
                        Text(
                          _controller.onboardingPages[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                  _controller.onboardingPages.length,
                      (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? AppColor.primary
                            : AppColor.tertiary,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                backgroundColor: AppColor.primary,
                elevation: 0,
                onPressed: _controller.forwardAction,
                child: Obx(() {
                  return Text(_controller.isLastPage ? 'Start' : 'Next');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}