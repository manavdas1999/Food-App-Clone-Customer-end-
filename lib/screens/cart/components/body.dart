// Defines the body of the cart screen

import 'package:flutter/material.dart';
import 'package:food_customer_app/models/Cart.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

final myCart = Get.find<Cart>();

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: myCart.cartItems.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(top: 10),
            child: CartCard(cartItem: myCart.cartItems[index]),
          ),
        ),
      );
    });
  }
}
