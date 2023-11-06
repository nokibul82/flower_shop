import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click_flowers/src/view/screens/products_screen.dart';

import '../../../core/app_color.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          style: Theme.of(context).textTheme.bodyMedium,
          cursorColor: AppColor.primary,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            border: InputBorder.none,
          ),
          onChanged: (value) {
            // Perform search functionality here
          },
        ),
        iconTheme: const IconThemeData(color: AppColor.secondary),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(),
            onPressed: () {
              Get.to(() => ProductsScreen(title: _searchController.text));
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: Center(
          child: Column(
        children: [
          const Icon(Icons.search_outlined),
          Text(
            "Search for your desired products",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      )),
    );
  }
}
