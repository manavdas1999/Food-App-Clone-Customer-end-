// Defines the body of the otp screen

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_customer_app/constants.dart';
import 'package:food_customer_app/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  final phoneNumber = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              //TODO: phone number from complete_profile_screen
              Text("We sent your code to +91 $phoneNumber"),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 100.0, end: 0.0),
          duration: Duration(seconds: 100),
          builder: (_, dynamic value, child) => Text(
            "${value.toInt()} secs",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
