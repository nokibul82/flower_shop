import 'package:flutter/material.dart';

import '../../../core/app_color.dart';

class SlideItemWidget extends StatelessWidget {
  String? imagePath;
  String? text = "";
  Color? buttonTextColor;
  Color? buttonBackgroundColor;

  SlideItemWidget(
      {this.text,
      this.buttonTextColor = Colors.white,
      this.buttonBackgroundColor = AppColor.primary,
      this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Image.asset(
            imagePath!,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text!,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonBackgroundColor),
                    child: Text(
                      "Shop Now",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: buttonTextColor),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
