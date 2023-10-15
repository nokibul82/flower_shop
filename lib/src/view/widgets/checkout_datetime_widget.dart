import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/checkout_controller.dart';
import '../../../core/app_color.dart';

class CheckoutDatetimeWidget extends StatelessWidget {
  const CheckoutDatetimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColor.tertiary, borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        Text(
          "Choose Delivery Slot",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                  onTap: () async {
                    var pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    );
                    checkoutController.pickedDate(pickedDate);
                  },
                  child: Container(
                      height: Get.height * 0.07,
                      decoration: BoxDecoration(
                          color: AppColor.light,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Obx(() {
                          return Text(
                            DateFormat.MMMMEEEEd()
                                .format(checkoutController.pickedDate.value),
                            style: Theme.of(context).textTheme.bodyMedium,
                          );
                        }),
                      ))),
            ),
            const SizedBox(
              width: 2,
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () async {
                    var pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    checkoutController.pickedTime(pickedTime);
                  },
                  child: Container(
                      height: Get.height * 0.07,
                      decoration: BoxDecoration(
                          color: AppColor.light,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Obx(() {
                          return Text(
                            checkoutController.pickedTime.value.format(context),
                            style: Theme.of(context).textTheme.bodyMedium,
                          );
                        }),
                      ))),
            ),
          ],
        ),
      ]),
    );
  }
}
