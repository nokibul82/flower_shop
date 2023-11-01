import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/src/view/widgets/mybutton_widget.dart';
import 'package:one_click_flowers/src/view/widgets/mytextfield_widget.dart';

import '../../../core/app_color.dart';
import '../../../one_click_flowers.dart';
import 'checkout_screen.dart';
import 'home_screen.dart';

class DeliveryDetailsScreen extends StatelessWidget {
  DeliveryDetailsScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Delivery Details",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Full Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              MyTextFieldWidget(
                  textInputType: TextInputType.text,
                  controller: nameController,
                  hintText: "Full Name",
                  obscureText: false),
              Text(
                "Email",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              MyTextFieldWidget(
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false),
              Text(
                "Phone Number",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              MyTextFieldWidget(
                  controller: numberController,
                  hintText: "Phone Number",
                  obscureText: false,
                  textInputType: TextInputType.number,
              ),
              Text(
                "Details Address",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              MyTextFieldWidget(
                  textInputType: TextInputType.multiline,
                  controller: addressController,
                  hintText: "Details Address",
                  obscureText: false),
              MyButtonWidget(onTap: () {}, title: "Save Details")
            ],
          ),
        ),
      )),
    );
  }
}
