// Shows the Categories table on home screen

import 'package:flutter/material.dart';
import 'package:food_customer_app/screens/home/components/category_screen.dart';
import 'package:food_customer_app/screens/home/components/section_title.dart';
import 'package:get/get.dart';
import 'package:food_customer_app/enums.dart';
import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "image": "assets/images/categories/burger_0.jpg",
        "text": "Burger",
        "category": Category.burger
      },
      {
        "image": "assets/images/categories/pizza_0.jpg",
        "text": "Pizza",
        "category": Category.pizza
      },
      {
        "image": "assets/images/categories/fries_0.jpg",
        "text": "Fries",
        "category": Category.fries
      },
      {
        "image": "assets/images/categories/chicken_0.jpg",
        "text": "Chicken",
        "category": Category.chicken
      },
      {
        "image": "assets/images/categories/sandwich_0.jpg",
        "text": "Sandwich",
        "category": Category.sandwich
      },
      {
        "image": "assets/images/categories/icecream_0.jpg",
        "text": "Ice Cream",
        "category": Category.icecream
      },
      {
        "image": "assets/images/categories/drinks_0.jpg",
        "text": "Drinks",
        "category": Category.drinks
      },
      {
        "image": "assets/images/categories/thali_0.jpg",
        "text": "Thali",
        "category": Category.thali
      },
    ];
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Categories",
            press: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            children: List.generate(
              categories.length,
              (index) => CategoryCard(
                image: categories[index]["image"],
                text: categories[index]["text"],
                press: () => Get.to(() => CategoryScreen(
                    selectedCategory: categories[index]["category"])),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? image, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                image!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 2),
            Text(text!, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
