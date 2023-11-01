import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/src/view/screens/delivery_details_screen.dart';
import '../../controller/checkout_controller.dart';
import '../widgets/checkout_datetime_widget.dart';
import '../widgets/checkout_ordersummary_widget.dart';
import '../../../core/app_color.dart';
import 'home_screen.dart';

class CheckoutScreem extends StatelessWidget {
  CheckoutScreem({super.key});

  final CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.tertiary),
                  child: Column(
                    children: [
                      Text("Delivery Details",
                          style: Theme.of(context).textTheme.displayLarge),
                      ListTile(
                        leading: const Icon(Icons.home_rounded),
                        title: const Text("Please enter details"),
                        trailing: CircleAvatar(
                          backgroundColor: AppColor.secondary,
                          child: IconButton(
                            onPressed: () {
                              Get.to(() => DeliveryDetailsScreen(),
                                  transition: Transition.cupertino);
                            },
                            icon: const Icon(Icons.edit, color: AppColor.light),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const CheckoutDatetimeWidget(),
                const SizedBox(
                  height: 10,
                ),
                const CheckoutOrderSummaryWidget(),
                const SizedBox(
                  height: 10,
                ),
                bottomBarButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget bottomBarButton() {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
      onPressed: controller.isEmptyCart
          ? null
          : () {
        Get.to(CheckoutScreem(),transition: Transition.cupertino);
      },
      child: const Text("Checkout"),
    ),
  );
}