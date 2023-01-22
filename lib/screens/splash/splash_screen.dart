// Defines the Splash Screen

import 'package:flutter/material.dart';
import 'package:food_customer_app/components/default_button.dart';
import 'package:food_customer_app/size_config.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splashBG.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.red.withOpacity(0.6), BlendMode.dstATop),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FoodZee",
              style: TextStyle(
                color: Colors.red,
                fontSize: 80,
                fontWeight: FontWeight.w900,
                fontFamily: 'Muli',
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              width: 200,
              child: DefaultButton(
                text: "Sign In",
                press: () {
                  Get.toNamed("/sign_in");
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: DefaultButton(
                text: "Register",
                press: () {
                  Get.toNamed("/sign_up");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
