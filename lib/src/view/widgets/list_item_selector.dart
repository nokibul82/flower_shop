import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_click_flowers/src/model/occasion_model.dart';
import '../../model/product_category.dart';
import 'package:get/get.dart';

import '../../../core/app_color.dart';

class ListItemSelector extends StatefulWidget {
  const ListItemSelector({
    Key? key,
    required this.categories,
    required this.onItemPressed,
  }) : super(key: key);

  final List<dynamic> categories;
  final Function(int) onItemPressed;

  @override
  State<ListItemSelector> createState() => _ListItemSelectorState();
}

class _ListItemSelectorState extends State<ListItemSelector> {
  Widget item(OccasionModel item, int index) {
    return Tooltip(
      message: item.occasionsName,
      child: InkWell(
        onTap: () {

        },
        child: AnimatedContainer(
            margin: const EdgeInsets.only(left: 5),
            duration: const Duration(milliseconds: 500),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color:
                  item.isSelected == false ? AppColor.light : AppColor.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                item.occasionsName,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: item.isSelected == false
                          ? Colors.black
                          : Colors.white,
                    ),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (_, index) => item(widget.categories[index], index),
      ),
    );
  }
}
