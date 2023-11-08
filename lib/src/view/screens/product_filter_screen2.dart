import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/core/app_color.dart';
import 'package:one_click_flowers/src/model/category_model.dart';
import 'package:one_click_flowers/src/model/color_model.dart';
import 'package:one_click_flowers/src/model/occasion_model.dart';
import '../../controller/category_controller.dart';
import '../../model/addon_model.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  CategoryController categoryController = Get.put(CategoryController());

  List<ColorModel> selectedColors = [];
  List<OccasionModel> selectedOccations = [];
  List<CategoryModel> selectedCategories = [];
  List<AddonModel> selectedAddons = [];

  @override
  Widget build(BuildContext context) {
    double rating = 1.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
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
              Text('Categories'),
              Column(
                children: buildCategoryFilterList(),
              ),
              Divider(),

              // Size Filter
              Text('Occations'),
              Column(
                children: buildOccationFilterList(),
              ),
              Divider(),

              // Category Filter
              Text('Colors'),
              Column(
                children: buildColorFilterList(),
              ),
              Divider(),
              Text('Addons'),
              Column(
                children: buildAddonFilterList(),
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
          print('Selected Sizes: $selectedOccations');
          print('Selected Categories: $selectedCategories');
          print("selected $selectedAddons");
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

  List<Widget> buildAddonFilterList() {
    List<String> colors = ['Red', 'Green', 'Blue', 'Yellow', 'Other'];
    return categoryController.addonList.map((addon) {
      bool isChecked = selectedAddons.contains(addon);
      return CheckboxListTile(
        dense: true,
        title: Text(addon.addonsName),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              selectedAddons.add(addon);
            } else {
              selectedAddons.remove(addon);
            }
          });
        },
      );
    }).toList();
  }

  // Helper function to create a list of color options
  List<Widget> buildColorFilterList() {
    List<String> colors = ['Red', 'Green', 'Blue', 'Yellow', 'Other'];
    return categoryController.colorList.map((color) {
      bool isChecked = selectedColors.contains(color);
      return CheckboxListTile(
        dense: true,
        title: Text(color.colorName),
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
  List<Widget> buildOccationFilterList() {
    return categoryController.occasionList.map((occations) {
      bool isChecked = selectedOccations.contains(occations);
      return CheckboxListTile(
        dense: true,
        title: Text(occations.occasionsName),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              selectedOccations.add(occations);
            } else {
              selectedOccations.remove(occations);
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
    return categoryController.categoryList.map((category) {
      bool isChecked = selectedCategories.contains(category);
      return CheckboxListTile(
        dense: true,
        title: Text(category.catName),
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
