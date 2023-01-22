//Defines the Rating box widget used in app

import 'package:flutter/material.dart';
import 'package:food_customer_app/size_config.dart';

class RatingBox extends StatelessWidget {
  RatingBox({super.key, this.rating, this.size});

  String? rating;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green[900],
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(6.0),
            vertical: getProportionateScreenWidth(2.0)),
        child: Row(
          children: [
            Text(
              rating != null ? "${rating}" : "4.0",
              style: TextStyle(
                color: Colors.white,
                fontSize: size == null
                    ? getProportionateScreenWidth(13)
                    : getProportionateScreenWidth(size!),
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.white,
              size: size == null
                  ? getProportionateScreenWidth(14)
                  : getProportionateScreenWidth(size! + 1),
            ),
          ],
        ),
      ),
    );
  }
}
