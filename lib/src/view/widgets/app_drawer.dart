import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/core/app_color.dart';
import 'package:one_click_flowers/one_click_flowers.dart';
import 'package:one_click_flowers/src/controller/bottom_navbar_controller.dart';
import 'package:one_click_flowers/src/view/screens/customer_support_screen.dart';
import 'package:one_click_flowers/src/view/screens/login_screen.dart';
import 'package:one_click_flowers/src/view/screens/offers_screen.dart';
import 'package:one_click_flowers/src/view/screens/our_partner_screen.dart';
import 'package:one_click_flowers/src/view/screens/profile_screen.dart';
import 'package:one_click_flowers/src/view/screens/splash_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.background,
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const CircleAvatar(
              backgroundColor: AppColor.tertiary,
              radius: 50,
              child: Icon(
                Icons.person_rounded,
                size: 50,
                color: AppColor.background,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.person_rounded),
              title: const Text("Profile"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Get.to(() => const ProfileScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text("Home"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Get.put(BottomNavbarController()).changeTabIndex(0);
                Get.off(OneClickFlowers());
              },
            ),
            ListTile(
              leading: const Icon(Icons.category_rounded),
              title: const Text("All Category"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Get.put(BottomNavbarController()).changeTabIndex(3);
                Get.to(OneClickFlowers());
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_offer_rounded),
              title: const Text("Offers"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Get.to(() => const OffersScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.group_rounded),
              title: const Text("Our Partners"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Get.to(() => const OurPartnerScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.call_rounded),
              title: const Text("Contact Us"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Get.to(() => CustomerSupportScreen());
              },
            ),
            ListTile(
              tileColor: AppColor.tertiary,
              leading: const Icon(Icons.logout_rounded),
              title: const Text("Logout"),
              onTap: () {
                Get.to(LoginScreen());
              },
            ),
          ],
        ),
      )),
    );
  }
}
