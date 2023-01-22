//Defines the Restaurant Card widget used in app

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:food_customer_app/screens/single_restaurant/single_restaurant.dart';
import 'package:get/get.dart';
import 'package:food_customer_app/components/rating_box.dart';
import 'package:food_customer_app/size_config.dart';
import '../constants.dart';
import '../models/Restaurant.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({Key? key, required this.restaurantObject}) : super(key: key);

  final Restaurant restaurantObject;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SingleRestaurant(restaurantObject: restaurantObject));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shadowColor: Colors.black,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image(
                  image: AssetImage(restaurantObject.imagePath),
                  height: getProportionateScreenWidth(130),
                  width: getProportionateScreenWidth(270),
                  fit: BoxFit.cover,
                ),
                buildIcon(restaurantObject.isPopular),
              ],
            ),
            Container(
              width: 280, //
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10),
                  horizontal: getProportionateScreenWidth(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${capitalizeAllWord(restaurantObject.name)}',
                          // maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              height: 1,
                              fontSize: getProportionateScreenWidth(16),
                              color: Colors.black),
                        ),
                        Text('${tags(restaurantObject.tags)}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RatingBox(
                        rating: restaurantObject.rating,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Start from \₹${[
                          149,
                          249,
                          349,
                          399
                        ][Random().nextInt(4)]}.00",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          fontWeight: FontWeight.w600,
                          wordSpacing: 0.1,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(bool isPopular) {
    return isPopular
        ? Icon(
            Icons.star,
            size: 25,
            color: Colors.yellowAccent,
          )
        : SizedBox.shrink();
  }
}

String capitalizeAllWord(String value) {
  var result = value[0].toUpperCase();
  for (int i = 1; i < value.length; i++) {
    if (value[i - 1] == " ") {
      result = result + value[i].toUpperCase();
    } else {
      result = result + value[i];
    }
  }
  return result;
}

String tags(String tags) {
  List tagList = tags.split(", ");
  String finalTags = tagList.sublist(0, 3).join(', ');
  return capitalizeAllWord(finalTags);
}
