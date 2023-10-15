import 'package:get/get.dart';

class SliderController extends GetxController{
  RxInt slideIndex = 0.obs;
  void changeSlideIndex(int index){
    slideIndex = index as RxInt;
  }
}