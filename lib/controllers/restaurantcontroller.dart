// Defines the Controller Object for Restaurant data model

import 'package:food_customer_app/helpers/network.dart';
import 'package:get/get.dart';

import '../models/Restaurant.dart';

// URL to fetch Restaurant list from Backend API
String url = 'http://10.0.2.2:8000/restaurant/all/?format=json';

class RestaurantController extends GetxController {
  var restaurantList = <Restaurant>[].obs;

  @override
  void onInit() {
    fetchFoodList();
    super.onInit();
  }

  void onClose() {
    Get.delete<RestaurantController>();
    super.onClose();
  }

  void fetchFoodList() async {
    var jsonData = await NetworkServices().fetchData(url);
    restaurantList.value = restaurantListFromJson(jsonData);
  }
}
