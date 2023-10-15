import 'package:one_click_flowers/src/controller/bottom_navbar_controller.dart';
import 'package:one_click_flowers/src/view/screens/checkout_screen.dart';
import 'package:one_click_flowers/src/view/screens/home_screen.dart';

import '../../../core/app_color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions.dart';
import '../../../one_click_flowers.dart';
import '../../model/product.dart';
import '../widgets/empty_cart.dart';
import '../../controller/product_controller.dart';
import '../animation/animated_switcher_wrapper.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "My Cart",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }

  Widget cartList() {
    return SingleChildScrollView(
      child: Column(
        children: productController.cartProducts.mapWithIndex((index, _) {
          Product product = productController.cartProducts[index];
          return Dismissible(
            key: ValueKey<String>("${product.name}+${product.price}"),
            onDismissed: (d) {
              productController.removeFromCart(product);
            },
            direction: DismissDirection.endToStart,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColor.tertiary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                // spacing: 10,
                // runSpacing: 10,
                // crossAxisAlignment: WrapCrossAlignment.center,
                // alignment: WrapAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.light,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                            product.images[1],
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name.nextLine,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        productController.getCurrentSize(product),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        productController.isPriceOff(product)
                            ? "\$${product.off}"
                            : "\$${product.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 23,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              splashRadius: 10.0,
                              onPressed: () =>
                                  productController.decreaseItemQuantity(product),
                              icon: const Icon(
                                Icons.remove,
                                color: AppColor.primary,
                              ),
                            ),
                            GetBuilder<ProductController>(
                              builder: (ProductController controller) {
                                return AnimatedSwitcherWrapper(
                                    child: Text(
                                  '${controller.cartProducts[index].quantity}',
                                  key: ValueKey<int>(
                                    controller.cartProducts[index].quantity,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ));
                              },
                            ),
                            IconButton(
                              splashRadius: 10.0,
                              onPressed: () =>
                                  productController.increaseItemQuantity(product),
                              icon: const Icon(Icons.add,
                                  color: AppColor.primary),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
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
          AnimatedSwitcherWrapper(
              child: Text(
            "\$${productController.totalPrice}",
            key: ValueKey<int>(productController.totalPrice.value),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppColor.primary,
            ),
          ))
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
          onPressed: productController.isEmptyCart
              ? null
              : () {
                  Get.to(() => CheckoutScreem(),
                      transition: Transition.cupertino);
                },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Buy Now"),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    productController.getCartItems();
    productController.calculateTotalPrice();
    return Scaffold(
      appBar: _appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: !productController.isEmptyCart ? cartList() : const EmptyCart(),
          ),
          bottomBarTitle(),
          bottomBarButton()
        ],
      ),
    );
  }
}
