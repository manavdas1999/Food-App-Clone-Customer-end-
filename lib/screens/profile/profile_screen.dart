// Defines the user profile screen

import 'package:flutter/material.dart';
import 'package:food_customer_app/components/custom_bottom_nav_bar.dart';
import 'package:food_customer_app/constants.dart';
import 'package:food_customer_app/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
