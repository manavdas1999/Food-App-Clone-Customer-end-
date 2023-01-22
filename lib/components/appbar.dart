//Defines the Location Based Appbar used in the app.

import 'package:flutter/material.dart';
import 'package:food_customer_app/constants.dart';
import 'package:food_customer_app/size_config.dart';

PreferredSizeWidget myAppBar(List<String> myAddress, VoidCallback onTap) {
  return AppBar(
    titleSpacing: 0,
    iconTheme: const IconThemeData(color: Colors.white, size: 22),
    backgroundColor: kPrimaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    titleTextStyle: TextStyle(
      fontSize: getProportionateScreenWidth(16),
      color: Colors.white,
    ),
    title: GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          Icon(
            (Icons.location_on_outlined),
            size: 30,
          ),
          SizedBox(width: getProportionateScreenWidth(2)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                myAddress.isNotEmpty ? myAddress[0] : 'Tap to get Address',
                style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                myAddress.isNotEmpty ? myAddress[1] : '',
                style: TextStyle(fontSize: 12, height: 1, letterSpacing: 0.1),
              )
            ],
          )
        ],
      ),
    ),
    actions: [
      Row(
        children: [
          Icon(
            Icons.local_offer_outlined,
          ),
          SizedBox(width: getProportionateScreenWidth(2)),
          Text(
            "Offers",
            style: TextStyle(
                fontSize: 15, height: 1.5, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: getProportionateScreenWidth(18))
        ],
      )
    ],
  );
}
