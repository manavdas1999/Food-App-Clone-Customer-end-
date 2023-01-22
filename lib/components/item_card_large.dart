//Defines the item card widget used in app.

import 'package:flutter/material.dart';
import 'package:food_customer_app/size_config.dart';
import 'package:food_customer_app/constants.dart';
import '../models/Food.dart';
import 'rating_box.dart';

class ItemCardLarge extends StatelessWidget {
  const ItemCardLarge({
    required this.foodObject,
  });
  final Food foodObject;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shadowColor: Colors.black,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: Column(
          children: [
            Image(
              height: getProportionateScreenWidth(160),
              width: double.infinity,
              image: AssetImage(foodObject.imagePath),
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodObject.name,
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.black),
                      ),
                      Text(foodObject.details,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(12),
                              color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      RatingBox(),
                      Text(
                        "\₹${foodObject.price}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w600,
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
}
