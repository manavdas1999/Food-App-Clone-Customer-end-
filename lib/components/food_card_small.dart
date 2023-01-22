// Defines another type of food card widget

import 'package:flutter/material.dart';
import 'package:food_customer_app/components/rating_box.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../models/Cart.dart';
import '../models/Food.dart';
import '../size_config.dart';

class FoodCardSmall extends StatelessWidget {
  final myCart = Get.find<Cart>();

  FoodCardSmall({
    Key? key,
    this.width = 140,
    required this.foodObject,
  }) : super(key: key);

  final double width;
  final Food foodObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        height: getProportionateScreenWidth(280),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              // padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Hero(
                tag: foodObject.id.toString(),
                child: Image.asset(
                  foodObject.imagePath,
                  fit: BoxFit.cover,
                  height: getProportionateScreenWidth(140),
                  width: getProportionateScreenWidth(300),
                ),
              ),
            ),
            // const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    capitalizeAllWord(foodObject.name),
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\₹${foodObject.price}",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                      RatingBox(
                        rating: foodObject.rating,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 14,
                            color: Colors.green,
                          ),
                          Text("${foodObject.preptime}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.red))),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.green;
                        }
                        return kPrimaryColor;
                      }),
                      textStyle: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return size 40, otherwise 20
                        if (states.contains(MaterialState.pressed)) {
                          return TextStyle(fontSize: 15);
                        }
                        return TextStyle(fontSize: 13);
                      }),
                    ),
                    child: Text("Add To Cart"),
                    onPressed: () {
                      myCart.addToCart(foodObject);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
