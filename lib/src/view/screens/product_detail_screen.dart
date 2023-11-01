import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/app_color.dart';
import '../../model/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../model/product_model.dart';
import '../widgets/page_wrapper.dart';
import '../widgets/image_slider.dart';
import '../../controller/product_controller.dart';

final ProductController controller = Get.put(ProductController());

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }

  Widget productPageView(double width, double height) {
    return Container(
      height: height * 0.42,
      width: width,
      decoration: const BoxDecoration(
        color: AppColor.light,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(200),
          bottomLeft: Radius.circular(200),
        ),
      ),
      child: ImageSlider(items: [
        "https://flowersandflowers.com.au/images/products/${product.pImage}",
        "https://flowersandflowers.com.au/images/products/${product.pImage}",
        "https://flowersandflowers.com.au/images/products/${product.pImage}"
      ]),
    );
  }

  Widget _ratingBar(BuildContext context) {
    return Wrap(
      spacing: 30,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        RatingBar.builder(
          itemSize: 30,
          initialRating: 1,
          direction: Axis.horizontal,
          itemBuilder: (_, __) => const Icon(Icons.star, color: Colors.amber,),
          onRatingUpdate: (_) {},
        ),
        Text(
          "(4500 Reviews)",
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w300),
        )
      ],
    );
  }

  Widget productSizesListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.sizeType(product).length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () => controller.switchBetweenProductSizes(product, index),
          child: AnimatedContainer(
            margin: const EdgeInsets.only(right: 5, left: 5),
            alignment: Alignment.center,
            width: controller.isNominal(product as Product) ? 40 : 70,
            decoration: BoxDecoration(
              color: controller.sizeType(product)[index].isSelected == false
                  ? AppColor.light
                  : AppColor.primary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.secondary, width: 0.8),
            ),
            duration: const Duration(milliseconds: 300),
            child: FittedBox(
              child: Text(
                controller.sizeType(product)[index].numerical,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: PageWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productPageView(width, height),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.pName,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 10),
                      _ratingBar(context),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            product.pPOff.isNotEmpty
                                ? "\$${product.pSPrice}"
                                : "\$${product.pPrice}",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(width: 3),
                          Visibility(
                            visible: product.pPOff.isNotEmpty ? true : false,
                            child: Text(
                              "\$${product.pPrice}",
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            product.pAvailability == "1"
                                ? "Available in stock"
                                : "Not available",
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "About",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(product.pShortDescription),
                      const SizedBox(height: 20),
                      controller.sizeType(product).isNotEmpty
                          ? SizedBox(
                              height: 40,
                              child: GetBuilder<ProductController>(
                                builder: (_) => productSizesListView(),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: product.pAvailability == "1"
                              ? () => controller.addToCart(product)
                              : null,
                          child: const Text("Add to cart"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
