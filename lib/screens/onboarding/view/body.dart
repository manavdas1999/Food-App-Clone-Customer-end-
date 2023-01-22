// Defines the body of onboarding screens

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:food_customer_app/components/default_button.dart';
import 'package:food_customer_app/constants.dart';
import 'package:food_customer_app/size_config.dart';

import 'onboarding_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  PageController _pageController = PageController();
  List<Map<String, String>> onboardingData = [
    {
      "text": "Find your favourite food",
      "description":
          "Find your favourite food from restaurants near you and add to cart",
      "image": "assets/images/onboarding/onboarding_img1.png"
    },
    {
      "text": "Order your food online",
      "description":
          "Order your food online from wide range of restaurants and shops listed",
      "image": "assets/images/onboarding/onboarding_img2.png"
    },
    {
      "text": "Get fastest delivery",
      "description":
          "Get the freshly prepared food delivered at your place on time",
      "image": "assets/images/onboarding/onboarding_img3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  image: onboardingData[index]["image"],
                  text: onboardingData[index]['text'],
                  description: onboardingData[index]['description'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: currentPage == 2 ? "Continue" : "Next",
                      press: () {
                        if (currentPage == 2) {
                          Get.toNamed("/splash");
                        } else {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 7,
      width: currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
