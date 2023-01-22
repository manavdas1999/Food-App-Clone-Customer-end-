// Defines the Checkout Card widget used in cart screen
// Razorpay Payment Gateway is applied here

import 'package:flutter/material.dart';
import 'package:food_customer_app/controllers/paymentcontroller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_customer_app/components/default_button.dart';

import '../../../constants.dart';
import '../../../models/Cart.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  final paymentController = Get.find<PaymentController>();

  CheckoutCard({
    Key? key,
  }) : super(key: key);

  final myCart = Get.find<Cart>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.5),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            Obx(() {
              // option details for razorpay Orders API
              final options = {
                'key': 'rzp_test_1p3iaQir1J3fZk',
                'amount': (myCart.total * 100)
                    .toString(), //in the smallest currency sub-unit.
                'name': 'FoodZee App (Manav Das)',
                // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                'description': myCart.cartItems
                    .map((element) => element.name)
                    .toList()
                    .join(', '),
                'timeout': 300, // in seconds
                'prefill': {'contact': '', 'email': ''}
              };
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: "₹${myCart.total}0",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Check Out",
                      press: () {
                        paymentController.razorpay.open(options);
                      },
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
