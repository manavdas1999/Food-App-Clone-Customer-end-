// Empty Cart screen

import 'package:flutter/material.dart';
import 'package:food_customer_app/size_config.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/empty_cart.png'),
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: getProportionateScreenWidth(25),
          ),
          Text(
            "Your Cart is Empty!",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(26),
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Looks like you haven't added anything in your cart yet.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.grey[600],
              ),
            ),
          )
        ],
      ),
    );
  }
}
