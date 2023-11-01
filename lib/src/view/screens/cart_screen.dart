import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'checkout_screen.dart';
import '../../../core/app_color.dart';
import '../../model/product_model.dart';
import '../../../core/extensions.dart';
import '../../controller/product_controller.dart';
import '../animation/animated_switcher_wrapper.dart';
import '../widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final ProductController controller = Get.put(ProductController());
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "My cart",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  Widget cartList() {
    return SingleChildScrollView(
      child: Column(
        children: controller.cartProducts.mapWithIndex((index, _) {
          ProductModel product = controller.cartProducts[index];
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.light,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              // spacing: 10,
              // runSpacing: 10,
              // crossAxisAlignment: WrapCrossAlignment.center,
              // alignment: WrapAlignment.spaceEvenly,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorExtension.randomColor,
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.network(
                          "https://flowersandflowers.com.au/images/products/${product.pImage}",
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.pName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Text(
                    //   controller.getCurrentSize(product as Product),
                    //   style: TextStyle(
                    //     color: Colors.black.withOpacity(0.5),
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    const SizedBox(height: 5),
                    Text(
                      controller.isPriceOff(product)
                          ? "\$${product.pSPrice}"
                          : "\$${product.pPrice}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 23,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            splashRadius: 10.0,
                            onPressed: () =>
                                controller.decreaseItemQuantity(product),
                            icon: const Icon(
                              Icons.remove,
                              color: AppColor.primary,
                            ),
                          ),
                          GetBuilder<ProductController>(
                            builder: (ProductController controller) {
                              return Text(
                                product.pQuantity,
                                key: ValueKey<String>(
                                  product.pQuantity,
                                ),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            },
                          ),
                          IconButton(
                            splashRadius: 10.0,
                            onPressed: () =>
                                controller.increaseItemQuantity(product),
                            icon:
                                const Icon(Icons.add, color: AppColor.primary),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget bottomBarTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          Obx(
            () {
              return AnimatedSwitcherWrapper(
                child: Text(
                  "\$${controller.totalPrice.value}",
                  key: ValueKey<int>(controller.totalPrice.value),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: AppColor.primary,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget bottomBarButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
          onPressed: controller.isEmptyCart
              ? null
              : () {
                  Get.to(CheckoutScreem(),transition: Transition.cupertino);
                },
          child: const Text("Buy Now"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getCartItems();
    controller.calculateTotalPrice();
    return Scaffold(
      appBar: _appBar(context),
      body: RefreshIndicator(
        color: AppColor.primary,
        onRefresh: () async {
          controller.calculateTotalPrice();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: !controller.isEmptyCart ? cartList() : const EmptyCart(),
            ),
            bottomBarTitle(),
            bottomBarButton()
          ],
        ),
      ),
    );
  }
}
