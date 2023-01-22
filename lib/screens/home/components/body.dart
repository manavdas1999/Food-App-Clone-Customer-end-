// Body of the homescreen

import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'popular_picks.dart';
import 'specials_section.dart';
import 'all_restaurant.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            DiscountBanner(),         // Discounts section
            SizedBox(height: getProportionateScreenWidth(20)),
            Categories(),             // Categories section
            SpecialsSection(),        // Specials section
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularPicksSection(),    // Popular picks section
            SizedBox(height: getProportionateScreenWidth(30)),
            AllRestaurantsSection(),  // All Restaurants section
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
