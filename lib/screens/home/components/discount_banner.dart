// Shows the offers and discounts on home screen

import 'package:flutter/material.dart';
import 'package:food_customer_app/screens/home/components/section_title.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Offers For You",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              OffersCard(
                  image: 'assets/images/offer_banners/offer_banner_1.jpeg'),
              OffersCard(
                  image: 'assets/images/offer_banners/offer_banner_2.jpeg'),
              OffersCard(
                  image: 'assets/images/offer_banners/offer_banner_3.jpeg'),
              SizedBox(width: getProportionateScreenWidth(10)),
            ],
          ),
        ),
      ],
    );
    ;
  }
}

class OffersCard extends StatelessWidget {
  OffersCard({
    required this.image,
    super.key,
  });
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        height: getProportionateScreenWidth(150),
        width: getProportionateScreenWidth(280),
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ));
  }
}
