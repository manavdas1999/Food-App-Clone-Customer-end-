//Defines the food card widget used in app

import 'package:flutter/material.dart';
import 'package:food_customer_app/size_config.dart';
import 'package:food_customer_app/constants.dart';
import 'package:get/get.dart';
import '../models/Cart.dart';
import '../models/Food.dart';
import 'rating_box.dart';

class FoodCard extends StatelessWidget {
  FoodCard({Key? key, required this.foodObject}) : super(key: key);

  final Food foodObject;
  final myCart = Get.find<Cart>();

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
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Image(
                    image: AssetImage(foodObject.imagePath),
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                  buildIcon(foodObject.isPopular),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: getProportionateScreenWidth(2),
                    ),
                    Text(
                      capitalizeAllWord(foodObject.name),
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1,
                        wordSpacing: 0.1,
                        fontSize: getProportionateScreenWidth(16),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(4),
                    ),
                    Row(
                      children: [
                        RatingBox(
                          rating: foodObject.rating,
                        ),
                        Text(
                          " | ${foodObject.preptime} | ₹${foodObject.price}",
                          style: TextStyle(
                            color: Colors.grey.shade800,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(4),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${tags(foodObject.tags)}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade800,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
                            textStyle:
                                MaterialStateProperty.resolveWith((states) {
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
                    )
                  ],
                ),
              ),
            )
          ],
        ));
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
