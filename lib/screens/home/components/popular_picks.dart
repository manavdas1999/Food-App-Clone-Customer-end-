// 'Popular picks Section' on home screen

import 'package:flutter/material.dart';
import 'package:food_customer_app/components/food_card_small.dart';
import 'package:get/get.dart';

import '../../../controllers/foodcontroller.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularPicksSection extends StatelessWidget {
  final foodcontroller = Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Picks ", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            final foodPopularList = foodcontroller.foodList.value
                .where((i) => i.isPopular)
                .toList();
            return Row(
              children: [
                ...List.generate(
                    foodPopularList.length,
                    (index) => FoodCardSmall(
                          foodObject: foodPopularList[index],
                        )),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            );
          }),
        )
      ],
    );
  }
}
