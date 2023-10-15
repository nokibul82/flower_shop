import 'package:flutter/material.dart';
import '../src/model/bottom_navy_bar_item.dart';
import '../src/model/product_banner_model.dart';
import '../src/model/product_size_type.dart';
import '../src/model/product_category.dart';
import '../src/model/categorical.dart';
import '../src/model/numerical.dart';
import '../src/model/product.dart';
import '../src/view/widgets/slide_item_widget.dart';
import 'app_color.dart';
class AppData {
  const AppData._();

  static String dummyText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting'
      ' industry. Lorem Ipsum has been the industry\'s standard dummy text'
      ' ever since the 1500s, when an unknown printer took a galley of type'
      ' and scrambled it to make a type specimen book.';

  static List<Product> products = [
    Product(
      name: 'Flowers daisy pink stick',
      price: 40,
      about: dummyText,
      isAvailable: true,
      off: 50,
      quantity: 1,
      images: [
        'assets/image/product/product-1.png',
        'assets/image/product/product-2.png',
        'assets/image/product/product-3.png'
      ],
      isFavorite: true,
      rating: 1,
      type: ProductType.Tulips,
    ),
    Product(
      name: 'Jasmine flowers white',
      price: 380,
      about: dummyText,
      isAvailable: false,
      off: 220,
      quantity: 0,
      images: [
        'assets/image/product/product-2.png',
        'assets/image/product/product-5.png',
        'assets/image/product/product-6.png'
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.Lilies,
    ),
    Product(
      name: 'Blossom bouquet flower',
      price: 650,
      about: dummyText,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/image/product/product-3.png',
        'assets/image/product/product-2.png',
        'assets/image/product/product-3.png',
      ],
      isFavorite: false,
      rating: 3,
      type: ProductType.Lilies,
    ),
    Product(
      name: 'Orchid flower red stick',
      price: 229,
      about: dummyText,
      isAvailable: true,
      off: 200,
      quantity: 0,
      images: [
        'assets/image/product/product-4.png',
        'assets/image/product/product-5.png',
        'assets/image/product/product-6.png'
      ],
      isFavorite: false,
      rating: 5,
      sizes: ProductSizeType(
        categorical: [
          Categorical(CategoricalType.small, true),
          Categorical(CategoricalType.medium, false),
          Categorical(CategoricalType.large, false),
        ],
      ),
      type: ProductType.Orchids,
    ),
    Product(
      name: 'Hyacinth white stick',
      price: 330,
      about: dummyText,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/image/product/product-5.png',
        'assets/image/product/product-5.png',
        'assets/image/product/product-6.png'
      ],
      isFavorite: false,
      rating: 4,
      sizes: ProductSizeType(
        numerical: [Numerical('41', true), Numerical('45', false)],
      ),
      type: ProductType.Orchids,
    ),
    Product(
        name: 'Blossom bouquet flower',
        price: 230,
        about: dummyText,
        isAvailable: true,
        off: null,
        quantity: 0,
        images: [
          'assets/image/product/product-6.png',
          'assets/image/product/product-5.png',
          'assets/image/product/product-6.png'
        ],
        isFavorite: false,
        rating: 2,
        type: ProductType.Roses),
    Product(
      name: 'Hyacinth white stick',
      price: 497,
      about: dummyText,
      isAvailable: true,
      off: null,
      quantity: 0,
      images: [
        'assets/image/product/product-1.png',
        'assets/image/product/product-5.png',
        'assets/image/product/product-6.png'
      ],
      isFavorite: false,
      rating: 3,
      sizes: ProductSizeType(
        numerical: [
          Numerical('43', true),
          Numerical('50', false),
          Numerical('55', false)
        ],
      ),
      type: ProductType.Roses,
    ),
    Product(
      name: 'Blossom bouquet flower',
      price: 45,
      about: dummyText,
      isAvailable: true,
      off: 35,
      quantity: 0,
      images: [
        'assets/image/product/product-3.png',
        'assets/image/product/product-5.png',
        'assets/image/product/product-6.png'
      ],
      isFavorite: false,
      sizes: ProductSizeType(
        numerical: [
          Numerical('50', true),
          Numerical('65', false),
          Numerical('85', false)
        ],
      ),
      rating: 2,
      type: ProductType.Him,
    ),
  ];

  static List<ProductCategory> categories = [
    ProductCategory(
      ProductType.All,
      true,
    ),
    ProductCategory(
      ProductType.Roses,
      false,
    ),
    ProductCategory(ProductType.Orchids, false,),
    ProductCategory(
      ProductType.Lilies,
      false,
    ),
    ProductCategory(
      ProductType.Orchids,
      false,
    ),
    ProductCategory(
      ProductType.Him,
      false,
    ),
    ProductCategory(
      ProductType.Her,
      false,
    ),

  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static List<BottomNavyBarItem> bottomNavyBarItems = [
    BottomNavyBarItem(
      "Home",
      const Icon(Icons.home),
      AppColor.primary,
      AppColor.secondary,
    ),
    BottomNavyBarItem(
      "Favorite",
      const Icon(Icons.favorite),
      AppColor.primary,
      AppColor.secondary,
    ),
    BottomNavyBarItem(
      "Cart",
      const Icon(Icons.shopping_cart),
      AppColor.primary,
      AppColor.secondary,
    ),
  ];

  static List<ProductBanner> recommendedProducts = [
    ProductBanner(
      imagePath: "assets/image/slider/home1-slide1.jpg",
      cardBackgroundColor: AppColor.tertiary,
    ),
    ProductBanner(
      imagePath: "assets/image/slider/home2-slide1.jpg",
      cardBackgroundColor: AppColor.primary,
      buttonBackgroundColor: AppColor.background,
      buttonTextColor: Colors.white,
    ),
    ProductBanner(
      imagePath: "assets/image/slider/home3-slide1.jpg",
      cardBackgroundColor: AppColor.primary,
      buttonBackgroundColor: AppColor.background,
      buttonTextColor: Colors.white,
    ),
  ];
  
  static List<SlideItemWidget> sliderProducts = [
    SlideItemWidget(imagePath: "assets/image/slider/home2-slide1.jpg",text: "For Mother's Day",),
    SlideItemWidget(imagePath: "assets/image/slider/home2-slide2.jpg",text: "For Friendship Day",),
    SlideItemWidget(imagePath: "assets/image/slider/home3-slide1.jpg",text: "For Father's Day",),
  ];

  static List<String> bannerImages = [
    "assets/image/slider/home2-slide1.jpg",
    "assets/image/slider/home2-slide2.jpg",
    "assets/image/slider/home3-slide1.jpg",
    "assets/image/slider/home3-slide2.jpg"
  ];

  static List<String> partnerImages = [
    "assets/image/partners/flower_shop_logo1.png",
    "assets/image/partners/flower_shop_logo2.png",
    "assets/image/partners/flower_shop_logo3.png",
    "assets/image/partners/flower_shop_logo4.jpg",
    "assets/image/partners/flower_shop_logo5.jpg",
    "assets/image/partners/flower_shop_logo6.jpg",
  ];
}
