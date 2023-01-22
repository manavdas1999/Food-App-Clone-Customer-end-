// Shows the list of all restaurants

import 'package:flutter/material.dart';
import 'package:food_customer_app/components/Restaurant_card.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../controllers/restaurantcontroller.dart';

class RestaurantList extends StatelessWidget {
  RestaurantList({Key? key}) : super(key: key);
  final restaurantController = Get.find<RestaurantController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'All Restaurants',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(width: double.infinity, child: restaurantList()));
  }

  Obx restaurantList() {
    return Obx(() {
      return ListView.builder(
        itemCount: restaurantController.restaurantList.length,
        itemBuilder: (context, index) => RestaurantCard(
            restaurantObject: restaurantController.restaurantList[index]),
      );
    });
  }
}
