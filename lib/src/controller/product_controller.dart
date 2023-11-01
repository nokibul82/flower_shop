import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:one_click_flowers/core/app_color.dart';
import '../../core/app_data.dart';
import '../model/product.dart';
import '../model/numerical.dart';
import '../model/product_category.dart';
import '../model/product_model.dart';
import '../model/product_size_type.dart';

class ProductController extends GetxController {
  @override
  void onInit() async {
    await getAllProducts();
    super.onInit();
  }

  List<Product> allProducts = AppData.products;
  RxList<Product> filteredProducts = AppData.products.obs;
  RxList<Product> cartProducts = <Product>[].obs;
  RxList<ProductCategory> categories = AppData.categories.obs;
  RxInt totalPrice = 0.obs;

  List productList = <ProductModel>[].obs;
  var isLoading = false.obs;

  Future<void> getAllProducts() async {
    print("getAllProducts called");
    try {
      isLoading.value = true;
      productList.clear();
      Uri url = Uri.parse('http://api.norisms.com/products.php');
      final response = await http.get(url,
          headers: {
        "Accept": "application/json",
      }
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        isLoading.value = false;
        final responseJson = json.decode(response.body);
        for (var product in responseJson["body"]) {
          productList.add(ProductModel.fromJson(product));
          print("1 added");
        }
        print(productList.length);
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
      print("$e ====>>> Error from getAllProducts()");
    }
  }

  void filterItemsByCategory(int index) {
    for (ProductCategory element in categories) {
      element.isSelected = false;
    }
    categories[index].isSelected = true;

    if (categories[index].type == ProductType.All) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(allProducts.where((item) {
        return item.type == categories[index].type;
      }).toList());
    }
    update();
  }

  void isFavorite(int index) {
    filteredProducts[index].isFavorite = !filteredProducts[index].isFavorite;
    update();
  }

  void addToCart(Product product) {
    product.quantity = 1;
    cartProducts.add(product);
    cartProducts.assignAll(cartProducts);
    calculateTotalPrice();
    print(totalPrice);
    update();
  }

  void removeFromCart(Product product) {
    product.quantity = 0;
    cartProducts.remove(product);
    cartProducts.assignAll(cartProducts);
    calculateTotalPrice();
    update();
  }

  void increaseItemQuantity(Product product) {
    product.quantity++;
    calculateTotalPrice();
    update();
  }

  void decreaseItemQuantity(Product product) {
    product.quantity--;
    calculateTotalPrice();
    update();
  }

  bool isPriceOff(Product product) => product.off != null;

  bool get isEmptyCart => cartProducts.isEmpty;

  bool isNominal(Product product) => product.sizes?.numerical != null;

  void calculateTotalPrice() {
    totalPrice.value = 0;
    for (var element in cartProducts) {
      if (isPriceOff(element)) {
        totalPrice.value += element.quantity * element.off!;
      } else {
        totalPrice.value += element.quantity * element.price;
      }
    }
    print(totalPrice.value);
  }

  int calculateSubtotlaPrice(Product product) {
    return isPriceOff(product)
        ? product.off! * product.quantity
        : product.price * product.quantity;
  }

  getFavoriteItems() {
    filteredProducts.assignAll(
      allProducts.where((item) => item.isFavorite),
    );
  }

  getCartItems() {
    cartProducts.assignAll(
      allProducts.where((item) => item.quantity > 0),
    );
  }

  getAllItems() {
    filteredProducts.assignAll(allProducts);
  }

  List<Numerical> sizeType(Product product) {
    ProductSizeType? productSize = product.sizes;
    List<Numerical> numericalList = [];

    if (productSize?.numerical != null) {
      for (var element in productSize!.numerical!) {
        numericalList.add(Numerical(element.numerical, element.isSelected));
      }
    }

    if (productSize?.categorical != null) {
      for (var element in productSize!.categorical!) {
        numericalList.add(
          Numerical(
            element.categorical.name,
            element.isSelected,
          ),
        );
      }
    }

    return numericalList;
  }

  void switchBetweenProductSizes(Product product, int index) {
    sizeType(product).forEach((element) {
      element.isSelected = false;
    });

    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        element.isSelected = false;
      }

      product.sizes?.categorical![index].isSelected = true;
    }

    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        element.isSelected = false;
      }

      product.sizes?.numerical![index].isSelected = true;
    }

    update();
  }

  String getCurrentSize(Product product) {
    String currentSize = "";
    if (product.sizes?.categorical != null) {
      for (var element in product.sizes!.categorical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.categorical.name}";
        }
      }
    }

    if (product.sizes?.numerical != null) {
      for (var element in product.sizes!.numerical!) {
        if (element.isSelected) {
          currentSize = "Size: ${element.numerical}";
        }
      }
    }
    return currentSize;
  }
}
