import 'package:flutter/material.dart';
import '../../../core/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.32,
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (int currentIndex) {
              newIndex = currentIndex;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return FittedBox(
                fit: BoxFit.fitHeight,
                child: Image.network(widget.items[index], scale: 5),
              );
            },
          ),
        ),
        AnimatedSmoothIndicator(
          effect: const WormEffect(
            dotColor: AppColor.background,
            activeDotColor: AppColor.primary,
          ),
          count: widget.items.length,
          activeIndex: newIndex,
        )
      ],
    );
  }
}
