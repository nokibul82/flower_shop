import 'package:flutter/material.dart';
import 'package:one_click_flowers/core/app_color.dart';

class SquareTileWidget extends StatelessWidget {
  final String imagePath;
  const SquareTileWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.light,
      ),
      child: Image.asset(
        imagePath,
        height: 25,
      ),
    );
  }
}
