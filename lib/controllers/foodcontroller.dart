// Defines the Controller Object for Food data model

import 'package:food_customer_app/helpers/network.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../models/Food.dart';

// URL to fetch foodlist from backend API
String url = 'http://10.0.2.2:8000/food/all/?format=json';

class FoodController extends GetxController {
  var foodList = <Food>[].obs;

  @override
  void onInit() {
    fetchFoodList();
    super.onInit();
  }

  @override
  void onClose() {
    Get.delete<FoodController>();
    super.onClose();
  }

  void fetchFoodList() async {
    var jsonData = await NetworkServices().fetchData(url);
    foodList.value = foodListFromJson(jsonData);
  }
}
