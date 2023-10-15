import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/src/view/widgets/mytextfield_widget.dart';

import '../../../core/app_color.dart';
import '../../../one_click_flowers.dart';
import 'checkout_screen.dart';
import 'home_screen.dart';

class DeliveryDetailsScreen extends StatelessWidget {
  DeliveryDetailsScreen({super.key});

  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Order Details",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: Get.height * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "  Full Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              MyTextFieldWidget(controller: textEditingController, hintText: "hintText", obscureText: false),
              Spacer(),
              Text(
                "  Phone Number",
                style: Theme.of(context).textTheme.titleMedium,
              ),
               MyTextFieldWidget(controller: textEditingController, hintText: "hintText", obscureText: false),
              Spacer(),
              Text(
                "  Full Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
               MyTextFieldWidget(controller: textEditingController, hintText: "hintText", obscureText: false),
              Spacer(),
              Text(
                "  Full Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
               MyTextFieldWidget(controller: textEditingController, hintText: "hintText", obscureText: false),
              Spacer(),
              Text(
                "  Full Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
               MyTextFieldWidget(controller: textEditingController, hintText: "hintText", obscureText: false),
              Spacer(),
              Text(
                "  Full Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
               MyTextFieldWidget(controller: textEditingController, hintText: "hintText", obscureText: false),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20)),
                  onPressed: productController.isEmptyCart
                      ? null
                      : () {
                          Get.back();
                        },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Save Details"),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.sd_storage_rounded,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
