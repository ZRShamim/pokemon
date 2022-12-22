import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_api/components/colors/custom_color.dart';

class CustomSnackBar {
  static success(String message) {
    return Get.snackbar('Success', message,
        backgroundColor: CustomColor.blueDB, colorText: Colors.white);
  }

  static error(String message) {
    return Get.snackbar('Alert', message,
        backgroundColor: CustomColor.red, colorText: Colors.white);
  }
}
