import 'package:get/get.dart';
import '../one_click_flowers.dart';
import '../src/view/screens/cart_screen.dart';
import '../src/view/screens/favorite_screen.dart';
import '../src/view/screens/category_screen.dart';
import '../src/view/screens/home_screen.dart';
import '../src/view/screens/splash_screen.dart';

class AppPage{
  static List<GetPage> bottomNavPages = [
    GetPage(name: oneClickFlowers, page: () => OneClickFlowers(),transition: Transition.cupertino),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: favourites, page: () => const FavoriteScreen()),
    GetPage(name: cart, page: () => const CartScreen()),
    GetPage(name: category, page: () => const CategoryScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
  ];

  static String oneClickFlowers = "/OneClickFlowers";
  static String home = "/Home";
  static String favourites = "/Favourites";
  static String cart = "/Cart";
  static String category = "/Category";
  static String splashScreen = "/SplashScreen";
}