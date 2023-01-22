//Defines the screen for single restaurant screens

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom_bottom_nav_bar.dart';
import '../../components/food_card.dart';
import '../../components/rating_box.dart';
import '../../constants.dart';
import '../../controllers/foodcontroller.dart';
import '../../enums.dart';
import '../../models/Restaurant.dart';
import '../../size_config.dart';

class SingleRestaurant extends StatelessWidget {
  SingleRestaurant({Key? key, required this.restaurantObject})
      : super(key: key);

  final Restaurant restaurantObject;
  final foodcontroller = Get.find<FoodController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 35,
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                    image: AssetImage(restaurantObject.imagePath),
                    fit: BoxFit.cover),
              ),
            ),
            RestaurantInformation(restaurantObject: restaurantObject),

            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Text(
                'Food Menu',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20)),
              ),
            ),

            //Food Menu
            FoodItemsList(),
          ],
        ),
      ),
    );
  }

  Obx FoodItemsList() {
    return Obx(() {
      final foodList = foodcontroller.foodList.value
          .where((i) => i.foodMenu == restaurantObject.id)
          .toList();
      print(foodList);
      return Column(
          children: List.generate(foodList.length,
              (index) => FoodCard(foodObject: foodList[index])));

      // return ListView.builder(
      //   itemCount: foodList.length,
      //   itemBuilder: (context, index) =>
      //       FoodCard(foodObject: foodList[index]),
      // );
    });
  }
}

class RestaurantInformation extends StatelessWidget {
  const RestaurantInformation({
    super.key,
    required this.restaurantObject,
  });

  final Restaurant restaurantObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Heading section
          Container(
            margin: EdgeInsets.only(
                top: getProportionateScreenWidth(28),
                bottom: getProportionateScreenWidth(5),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20)),
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
                        style: TextStyle(
                            height: 1,
                            fontSize: getProportionateScreenWidth(25),
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${tags(restaurantObject.tags)}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.black)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        child: RatingBox(
                      rating: restaurantObject.rating,
                      size: 18,
                    )),
                    // SizedBox(height: 16,),
                  ],
                )
              ],
            ),
          ),

          const LineDivider(),

          //Details section
          Container(
            margin: EdgeInsets.only(
                top: getProportionateScreenWidth(5),
                bottom: getProportionateScreenWidth(5),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                Text(
                  "${restaurantObject.details}.",
                  style: TextStyle(
                      wordSpacing: 1,
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.grey[800]),
                ),
              ],
            ),
          ),

          const LineDivider(),

          //Address section
          Container(
            padding: EdgeInsets.only(
                top: getProportionateScreenWidth(5),
                bottom: getProportionateScreenWidth(5),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address: ${restaurantObject.address}.",
                  style: TextStyle(
                      wordSpacing: 1,
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.grey[800]),
                ),
                Text(
                  "Contact: ${restaurantObject.phone}. ${restaurantObject.id}",
                  style: TextStyle(
                      wordSpacing: 1,
                      fontSize: getProportionateScreenWidth(14),
                      color: Colors.grey[800]),
                ),
              ],
            ),
          ),

          const LineDivider(),
        ],
      ),
    );
  }
}

class LineDivider extends StatelessWidget {
  const LineDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(360),
      child: const Divider(
        color: Colors.black,
        height: 10,
      ),
    );
  }
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
