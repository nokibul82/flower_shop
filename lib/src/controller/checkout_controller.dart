import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController{

  Rx<DateTime> _pickedDate = DateTime.now().obs;

  Rx<DateTime> get pickedDate => _pickedDate;

  set pickedDate(Rx<DateTime> value) {
    _pickedDate = value;
    _pickedDate.refresh();
  }
  Rx<TimeOfDay> _pickedTime = TimeOfDay.now().obs;

  Rx<TimeOfDay> get pickedTime => _pickedTime;

  set pickedTime(Rx<TimeOfDay> value) {
    _pickedTime = value;
    _pickedTime.refresh();
  }



}