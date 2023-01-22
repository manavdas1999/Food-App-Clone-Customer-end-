// This screen is visible after Payment Process is either success or failure.

import 'package:flutter/material.dart';
import 'package:food_customer_app/constants.dart';
import 'package:get/get.dart';
import 'package:food_customer_app/size_config.dart';

class PostPaymentScreen extends StatelessWidget {
  const PostPaymentScreen({Key? key, required this.isSuccess})
      : super(key: key);
  final bool isSuccess;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Your Order"),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.cancel,
              color: isSuccess ? Colors.green : Colors.red,
              size: 200,
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Text(
              isSuccess ? "Order Placed!" : "Transaction Failed!",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(26),
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(8),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                isSuccess
                    ? "Thanks for purchasing. We have received your order."
                    : "Something went wrong. Please try again later.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(50),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                ),
                onPressed: () => Get.toNamed("/home"),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  child: Text(
                    "Go Home",
                    style: TextStyle(fontSize: 18),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
