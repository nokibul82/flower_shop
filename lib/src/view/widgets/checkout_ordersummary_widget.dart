import 'package:flutter/material.dart';
import '../../../core/app_color.dart';
import '../../../one_click_flowers.dart';
import '../screens/home_screen.dart';

class CheckoutOrderSummaryWidget extends StatelessWidget {
  const CheckoutOrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColor.tertiary,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(
            "Order Summary",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Column(
            children: controller.cartProducts.map((product) {
              return ListTile(
                leading:
                Text("${product.pName} × ${product.pQuantity}"),
                trailing: Text(
                    "\$${controller.calculateSubtotalPrice(product)}"),
              );
            }).toList(),
          ),
          const ListTile(
            leading: Text("Delivery Charge"),
            trailing: Text("\$0"),
          ),
          const Divider(color: AppColor.dark),
          ListTile(
            leading: const Text("Grand Total"),
            trailing: Text("\$${controller.totalPrice}"),
          ),
        ],
      ),
    );
  }
}
