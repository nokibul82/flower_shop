import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../core/app_color.dart';
import '../model/category_model.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  List categoryList = <CategoryModel>[].obs;
  var isLoading = false.obs;

  Future<void> getAllCategories() async {
    print("getAllCategories Called");
    try {
      isLoading.value = true;
      categoryList.clear();
      Uri url = Uri.parse('https://api.norisms.com/categories.php');
      final response = await http.get(url, headers: {
        "Accept":
            "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = false;
        final responseJson = json.decode(response.body);
        for (var category in responseJson["body"]) {
          categoryList.add(CategoryModel.fromJson(category));
          print("1 added");
        }
        print(categoryList.length);
      } else {
        isLoading.value = false;
        Get.snackbar("Error", json.decode(response.body)["message"],
            snackPosition: SnackPosition.TOP,
            backgroundColor: AppColor.warning,
            colorText: AppColor.light);
      }
    } catch (e) {
      isLoading.value = false;
      print("=================================");
      print("$e ====>>> Error from getAllCategories()");
    }
  }
}
