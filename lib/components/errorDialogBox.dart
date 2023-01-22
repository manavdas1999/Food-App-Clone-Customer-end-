//Defines the Dialog box used in app.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_customer_app/constants.dart';

void printDialog(String errorMessage) {
  if (errorMessage != "") {
    Get.defaultDialog(
      title: 'FoodZee',
      titleStyle: const TextStyle(
          color: kPrimaryColor, fontWeight: FontWeight.bold),
      middleText: errorMessage,
    );
  }
}
