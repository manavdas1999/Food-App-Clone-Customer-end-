// Shows Page for each category dynamically.

import 'package:flutter/material.dart';
import 'package:food_customer_app/constants.dart';
import 'package:get/get.dart';
import 'package:food_customer_app/controllers/foodcontroller.dart';
import 'package:food_customer_app/enums.dart';

import '../../../components/custom_bottom_nav_bar.dart';
import '../../../components/food_card.dart';

class CategoryScreen extends StatelessWidget {
  final foodcontroller = Get.find<FoodController>();
  CategoryScreen({
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  final Category selectedCategory;
  int? categoryValue;

  @override
  Widget build(BuildContext context) {
    String category = 'food';
    if (selectedCategory == Category.burger) {
      category = 'burger';
      categoryValue = 1;
    } else if (selectedCategory == Category.pizza) {
      category = 'pizza';
      categoryValue = 6;
    } else if (selectedCategory == Category.fries) {
      category = 'fries';
      categoryValue = 4;
    } else if (selectedCategory == Category.chicken) {
      category = 'chicken dish';
      categoryValue = 2;
    } else if (selectedCategory == Category.sandwich) {
      category = 'sandwich';
      categoryValue = 7;
    } else if (selectedCategory == Category.icecream) {
      category = 'ice cream';
      categoryValue = 5;
    } else if (selectedCategory == Category.drinks) {
      category = 'beverages';
      categoryValue = 3;
    } else if (selectedCategory == Category.thali) {
      category = 'thali';
      categoryValue = 8;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          '${category.capitalize}s For You',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FoodCategoryList(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  Obx FoodCategoryList() {
    return Obx(() {
      final foodCategoryList = foodcontroller.foodList.value
          .where((i) => i.category == categoryValue)
          .toList();
      return ListView.builder(
        itemCount: foodCategoryList.length,
        itemBuilder: (context, index) =>
            FoodCard(foodObject: foodCategoryList[index]),
      );
    });
  }
}
