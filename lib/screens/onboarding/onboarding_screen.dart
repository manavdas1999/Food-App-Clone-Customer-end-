// Starts onboarding screens

import 'package:flutter/material.dart';

import 'view/body.dart';
import 'package:food_customer_app/size_config.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
