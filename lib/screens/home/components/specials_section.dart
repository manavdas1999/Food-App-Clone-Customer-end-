// 'Specials for you' recommendation section on home screen

import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialsSection extends StatelessWidget {
  const SpecialsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Specials for you",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                  image: "assets/images/food_items/chicken/chicken (10).jpeg",
                  headline: "Breakfast Recommendations",
                  numOfOptions: 18,
                  press: () {}),
              SpecialOfferCard(
                image: "assets/images/food_items/sandwich/sandwich (12).jpeg",
                headline: "Healthy Sandwiches",
                numOfOptions: 20,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/food_items/thali/thali (12).jpeg",
                headline: "Wholesome Thalis",
                numOfOptions: 16,
                press: () {},
              ),
              SpecialOfferCard(
                image: "assets/images/food_items/pizza/pizza (12).jpeg",
                headline: "Cheesy Pizzas",
                numOfOptions: 24,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.headline,
    required this.image,
    required this.numOfOptions,
    required this.press,
  }) : super(key: key);

  final String headline, image;
  final int numOfOptions;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(120),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$headline\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(19),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfOptions Options")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
