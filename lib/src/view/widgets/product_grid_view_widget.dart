import 'package:flutter/material.dart';
import 'package:one_click_flowers/core/app_color.dart';
import '../../model/product_model.dart';
import '../../model/product.dart';
import '../animation/open_container_wrapper.dart';

class ProductGridViewWidget extends StatelessWidget {
  const ProductGridViewWidget({
    Key? key,
    required this.items,
    required this.isPriceOff,
    required this.likeButtonPressed,
  }) : super(key: key);

  final List<ProductModel> items;
  final bool Function(ProductModel product) isPriceOff;
  final void Function(int index) likeButtonPressed;

  Widget _gridItemHeader(ProductModel product, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: isPriceOff(product),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.background,
              ),
              width: 80,
              height: 30,
              alignment: Alignment.center,
              child: Text(
                "${product.pPOff}% OFF",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: items[index].pAvailability == "1"
                  ? AppColor.primary
                  : AppColor.secondary,
            ),
            onPressed: () => likeButtonPressed(index),
          ),
        ],
      ),
    );
  }

  Widget _gridItemBody(ProductModel product) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColor.light,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.network(
        "https://flowersandflowers.com.au/images/products/${product.pImage}",
        fit: BoxFit.cover,
        width: 20,
        height: 20,
      ),
    );
  }

  Widget _gridItemFooter(ProductModel product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        decoration: const BoxDecoration(
          color: AppColor.background,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                product.pName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColor.dark,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  product.pPOff.isNotEmpty
                      ? "\$${product.pSPrice}"
                      : "\$${product.pPrice}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(width: 3),
                Visibility(
                  visible: product.pPOff.isNotEmpty ? true : false,
                  child: Text(
                    "\$${product.pPrice}",
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: AppColor.tertiary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          ProductModel product = items[index];
          return OpenContainerWrapper(
            product: product,
            child: GridTile(
              header: _gridItemHeader(product, index),
              footer: _gridItemFooter(product, context),
              child: _gridItemBody(product),
            ),
          );
        },
      ),
    );
  }
}
