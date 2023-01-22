// Defines the cart card widget used in cart screen

import 'package:flutter/material.dart';
import 'package:food_customer_app/screens/cart/components/body.dart';

import '../../../constants.dart';
import '../../../models/Food.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final Food cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                      cartItem.imagePath,
                      fit: BoxFit.cover,
                      width: getProportionateScreenWidth(90),
                      height: getProportionateScreenWidth(90),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            capitalizeAllWord(cartItem.name),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(15)),
                            maxLines: 2,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "₹${cartItem.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor,
                                fontSize: 14),
                          ),
                        ]),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                myCart.removeFromCart(cartItem);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(12)),
                child: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red[800],
                  size: 25,
                ),
              ),
            ),
          ],
        ));
  }
}

String capitalizeAllWord(String value) {
  var result = value[0].toUpperCase();
  for (int i = 1; i < value.length; i++) {
    if (value[i - 1] == " ") {
      result = result + value[i].toUpperCase();
    } else {
      result = result + value[i];
    }
  }
  return result;
}
