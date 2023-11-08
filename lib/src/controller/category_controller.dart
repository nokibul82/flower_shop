import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:one_click_flowers/src/model/addon_model.dart';
import 'package:one_click_flowers/src/model/color_model.dart';
import 'package:one_click_flowers/src/model/occasion_model.dart';
import 'package:one_click_flowers/src/model/size_model.dart';
import '../../core/app_color.dart';
import '../model/category_model.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    getAllCategories();
    getAllOccasions();
    getAllAddons();
    getAllColors();
    super.onInit();
  }

  List<CategoryModel> categoryList = <CategoryModel>[].obs;
  List<OccasionModel> occasionList = <OccasionModel>[].obs;
  List<AddonModel> addonList = <AddonModel>[].obs;
  List<ColorModel> colorList = <ColorModel>[].obs;
  List<SizeModel> sizeList = <SizeModel>[].obs;
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

  Future<void> getAllOccasions() async {
    print("getAllOccasions Called");
    try {
      isLoading.value = true;
      occasionList.clear();
      Uri url = Uri.parse('https://api.norisms.com/occasions.php');
      final response = await http.get(url, headers: {
        "Accept":
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = false;
        final responseJson = json.decode(response.body);
        for (var occasion in responseJson["body"]) {
          occasionList.add(OccasionModel.fromJson(occasion));
          print("1 added");
        }
        print(occasionList.length);
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
      print("$e ====>>> Error from getAllOccasions()");
    }
  }

  Future<void> getAllAddons() async {
    print("getAllAddons Called");
    try {
      isLoading.value = true;
      addonList.clear();
      Uri url = Uri.parse('https://api.norisms.com/index.php');
      final response = await http.get(url, headers: {
        "Accept":
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = false;
        final responseJson = json.decode(response.body);
        for (var addon in responseJson["body"]) {
          addonList.add(AddonModel.fromJson(addon));
          print("1 added");
        }
        print(addonList.length);
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
      print("$e ====>>> Error from getAllOccasions()");
    }
  }

  Future<void> getAllColors() async {
    print("getAllColors Called");
    try {
      isLoading.value = true;
      colorList.clear();
      Uri url = Uri.parse('https://api.norisms.com/colors.php');
      final response = await http.get(url, headers: {
        "Accept":
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = false;
        final responseJson = json.decode(response.body);
        for (var color in responseJson["body"]) {
          colorList.add(ColorModel.fromJson(color));
          print("1 added");
        }
        print(colorList.length);
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
      print("$e ====>>> Error from getAllOccasions()");
    }
  }

  Future<void> getAllSizes() async {
    print("getAllSizes Called");
    try {
      isLoading.value = true;
      colorList.clear();
      Uri url = Uri.parse('https://api.norisms.com/sizes.php');
      final response = await http.get(url, headers: {
        "Accept":
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"
      });
      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = false;
        final responseJson = json.decode(response.body);
        for (var size in responseJson["body"]) {
          sizeList.add(SizeModel.fromJson(size));
          print("1 added");
        }
        print(colorList.length);
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
      print("$e ====>>> Error from getAllOccasions()");
    }
  }
}
