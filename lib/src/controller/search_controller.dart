import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../core/app_color.dart';
import '../model/product_model.dart';

class SearchProductController extends GetxController{

  RxList<ProductModel> productList = <ProductModel>[].obs;
  var isLoading = false.obs;

  Future<void> search(String query) async {
    print("search called");
    try {
      isLoading.value = true;
      productList.clear();
      Uri url = Uri.parse('http://api.norisms.com/search.php?s=$query');
      final response = await http.get(url, headers: {
        "Accept": "application/json",
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = false;
        final responseJson = json.decode(response.body);
        print(responseJson);
        for (var product in responseJson["records"]) {
          productList.add(ProductModel.fromJson(product));
          print("1 added");
        }
        print(productList.length);
      } else {
        isLoading.value = false;
        Get.snackbar("", json.decode(response.body)["message"],
            snackPosition: SnackPosition.BOTTOM,
            dismissDirection: DismissDirection.horizontal,
            backgroundColor: AppColor.secondary,
            colorText: AppColor.light);
        print(response.statusCode);
      }
    } catch (e) {
      isLoading.value = false;
      print("=================================");
      print("$e ====>>> Error from getAllProducts()");
    }
  }

  void isFavorite(int index) {

  }

  bool isPriceOff(ProductModel product) => product.pPOff.isNotEmpty;


}