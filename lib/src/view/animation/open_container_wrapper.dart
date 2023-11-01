import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:one_click_flowers/core/app_color.dart';
import 'package:one_click_flowers/src/model/product_model.dart';
import '../../model/product.dart';
import '../screens/product_detail_screen.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    Key? key,
    required this.child,
    required this.product,
  }) : super(key: key);

  final Widget child;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      closedColor: AppColor.light,
      transitionType: ContainerTransitionType.fade,
      transitionDuration: const Duration(milliseconds: 500),
      closedBuilder: (_, VoidCallback openContainer) {
        return InkWell(onTap: openContainer, child: child);
      },
      openBuilder: (_, __) => ProductDetailScreen(product),
    );
  }
}
