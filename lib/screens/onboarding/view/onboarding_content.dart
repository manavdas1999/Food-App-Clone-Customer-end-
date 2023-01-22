//Defines the content widget of onboarding screens

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    this.text,
    this.description,
    this.image,
  }) : super(key: key);
  final String? text, description, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "FoodZee",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 2),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(285),
          width: getProportionateScreenWidth(255),
        ),
        Spacer(flex: 1),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          ),
        ),
        Spacer(flex: 1),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            description!,
            textAlign: TextAlign.center,
            style: TextStyle(
              // color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
