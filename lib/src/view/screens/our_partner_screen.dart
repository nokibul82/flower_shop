import 'package:flutter/material.dart';
import 'package:one_click_flowers/core/app_data.dart';

import '../../../core/app_color.dart';

class OurPartnerScreen extends StatelessWidget {
  const OurPartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Partners",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: AppData.partnerImages.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColor.tertiary,
                      image: DecorationImage(
                          image:
                              Image.asset(AppData.partnerImages[index]).image,
                          fit: BoxFit.cover)));
            }),
      ),
    );
  }
}
