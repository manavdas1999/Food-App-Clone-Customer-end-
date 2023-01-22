// Defines teh cart screen in the app

import 'package:flutter/material.dart';
import 'package:food_customer_app/constants.dart';
import 'package:food_customer_app/models/Cart.dart';
import 'package:food_customer_app/screens/cart/components/empty_cart.dart';
import 'package:get/get.dart';
import '../../controllers/paymentcontroller.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  final myCart = Get.find<Cart>();
  final paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Your Cart"),
                myCart.cartItems.length != 0
                    ? Text(
                        "${myCart.cartItems.length}",
                        style: TextStyle(fontSize: 15),
                      )
                    : SizedBox.shrink(),
              ],
            ),
            backgroundColor: kPrimaryColor,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          body: myCart.cartItems.length == 0 ? EmptyCart() : Body(),
          bottomNavigationBar: CheckoutCard(),
        );
      },
    );
  }
}
