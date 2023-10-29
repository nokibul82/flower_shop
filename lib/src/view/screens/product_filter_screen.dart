import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home_screen.dart';
import '../../../core/app_color.dart';

class ProductFilterScreen extends StatefulWidget {
  const ProductFilterScreen({super.key});

  @override
  State<ProductFilterScreen> createState() => _ProductFilterScreenState();
}

class _ProductFilterScreenState extends State<ProductFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                      dense: true,
                      title: Text(controller
                            .categories[index].type.name),
                      value: controller.categories[index].isSelected,
                      onChanged: (bool? value) {
                        setState(() {
                          controller.categories[index].isSelected =
                              value!;
                        });
                      });
                },
              ),
            ),
            Container(
              height: Get.height * 0.4,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: AppColor.primary,
                    dense: true,
                    title: Text(controller
                        .categories[index].type.name),
                    value: controller.categories[index].isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        controller.categories[index].isSelected = value!;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
