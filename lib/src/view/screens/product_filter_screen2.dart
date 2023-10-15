import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/core/app_color.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Define variables to track the selected options for color, size, and categories
  List<String> selectedColors = [];
  List<String> selectedSizes = [];
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    double rating = 1.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: IconThemeData(color: AppColor.secondary),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Range Selector
              const Text('Price Range'),
              Slider(
                value: rating,
                onChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
              // Color Filter
              Text('Color'),
              Column(
                children: buildCategoryFilterList(),
              ),
              Divider(),

              // Size Filter
              Text('Size'),
              Column(
                children: buildSizeFilterList(),
              ),
              Divider(),

              // Category Filter
              Text('Categories'),
              Column(
                children: buildColorFilterList(),
              ),
              Divider(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Get.back();
          // Handle filter application
          print('Selected Colors: $selectedColors');
          print('Selected Sizes: $selectedSizes');
          print('Selected Categories: $selectedCategories');
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 120,
          decoration: BoxDecoration(
              color: AppColor.primary, borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Apply Filters",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColor.light),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.check,
                color: AppColor.light,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create a list of color options
  List<Widget> buildColorFilterList() {
    List<String> colors = ['Red', 'Green', 'Blue', 'Yellow', 'Other'];
    return colors.map((color) {
      bool isChecked = selectedColors.contains(color);
      return CheckboxListTile(
        dense: true,
        title: Text(color),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              selectedColors.add(color);
            } else {
              selectedColors.remove(color);
            }
          });
        },
      );
    }).toList();
  }

  // Helper function to create a list of size options
  List<Widget> buildSizeFilterList() {
    List<String> sizes = ['Small', 'Medium', 'Large', 'XL', 'XXL'];
    return sizes.map((size) {
      bool isChecked = selectedSizes.contains(size);
      return CheckboxListTile(
        dense: true,
        title: Text(size),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              selectedSizes.add(size);
            } else {
              selectedSizes.remove(size);
            }
          });
        },
      );
    }).toList();
  }

  // Helper function to create a list of category options
  List<Widget> buildCategoryFilterList() {
    List<String> categories = [
      "All",
      "Roses",
      "Tulips",
      "Orchids",
      "Lilies",
      "Him",
      "Her",
      "Birthday"
    ];
    return categories.map((category) {
      bool isChecked = selectedCategories.contains(category);
      return CheckboxListTile(
        dense: true,
        title: Text(category),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              selectedCategories.add(category);
            } else {
              selectedCategories.remove(category);
            }
          });
        },
      );
    }).toList();
  }
}
