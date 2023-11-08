import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/search_controller.dart';
import 'products_screen.dart';

import '../../../core/app_color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final SearchProductController searchProductController =
      Get.put(SearchProductController());

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          style: Theme.of(context).textTheme.bodyMedium,
          cursorColor: AppColor.primary,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                _searchController.clear();
              },
              icon: const Icon(
                CupertinoIcons.add,
                size: 20,
              ),
            ),
            hintText: 'search here',
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            border: InputBorder.none,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
            onPressed: () {
              searchProductController.search(_searchController.text);
              Get.to(() => ProductsScreen(
                    title: _searchController.text,
                    productList: searchProductController.productList,
                  ));
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.search_outlined,
              color: AppColor.secondary,
              size: 80,
            ),
            Text(
              "Search for your desired products",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
