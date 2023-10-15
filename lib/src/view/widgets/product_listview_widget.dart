import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/src/view/animation/open_container_wrapper.dart';
import '../../../core/app_color.dart';
import '../../model/product.dart';

class ProductListViewWidget extends StatelessWidget {
  const ProductListViewWidget(
      {super.key,
      required this.items,
      required this.isPriceOff,
      required this.likeButtonPressed});

  final List<Product> items;
  final bool Function(Product product) isPriceOff;
  final void Function(int index) likeButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 228,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            Product product = items[index];
            return Container(
              margin: const EdgeInsets.only(right: 8),
              child: OpenContainerWrapper(
                  product: product,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: (Get.width - 40)/2 - 5,  // Depended on home page padding
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColor.light,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          //main section cloumn
                          children: [
                            Row(
                              // Header Section
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Visibility(
                                  visible: isPriceOff(product),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: AppColor.background,
                                    ),
                                    width: 70,
                                    height: 25,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "30% OFF",
                                      style:
                                          TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    color: items[index].isFavorite
                                        ? AppColor.primary
                                        : AppColor.secondary,
                                  ),
                                  onPressed: () => likeButtonPressed(index),
                                ),
                              ],
                            ),
                            Image.asset(
                              // Image Section
                              product.images[0],
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                            Container(
                              // Title & Price Section
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              height: 60,
                              decoration: const BoxDecoration(
                                color: AppColor.background,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.dark,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        product.off != null
                                            ? "\$${product.off}"
                                            : "\$${product.price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                      const SizedBox(width: 3),
                                      Visibility(
                                        visible:
                                            product.off != null ? true : false,
                                        child: Text(
                                          "\$${product.price}",
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: AppColor.tertiary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
