// 'Popular Restaurants Section' on home screen

import 'package:flutter/material.dart';
import 'package:food_customer_app/components/Restaurant_card.dart';
import 'package:get/get.dart';

import '../../../controllers/restaurantcontroller.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class AllRestaurantsSection extends StatelessWidget {
  final restaurantcontroller = Get.find<RestaurantController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
              title: "All Restaurants",
              press: () => Get.toNamed('/restaurants')),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        PopularRestaurantList(),
      ],
    );
  }

  Obx PopularRestaurantList() {
    return Obx(
      () {
        final popularRestaurantList = restaurantcontroller.restaurantList.value
            .where((i) => i.isPopular)
            .toList();
        return SizedBox(
          height: getProportionateScreenWidth(230),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: popularRestaurantList.length,
            itemBuilder: (context, index) =>
                RestaurantCard(restaurantObject: popularRestaurantList[index]),
          ),
        );
      },
    );
  }
}
