// Defines the bottom navigation bar used in app/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart';

import '../constants.dart';
import '../enums.dart';
import '../models/Cart.dart';

class CustomBottomNavBar extends StatelessWidget {
  final myCart = Get.find<Cart>();
  CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    final Color activeIconColor = Colors.white;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(
                  Icons.storefront_outlined,
                  size: MenuState.home == selectedMenu ? 30 : 25,
                  color: MenuState.home == selectedMenu
                      ? activeIconColor
                      : inActiveIconColor,
                ),
                onPressed: () => Get.toNamed('/home')),
            IconButton(
              icon: Icon(
                Icons.search_outlined,
                size: MenuState.search == selectedMenu ? 30 : 25,
                color: MenuState.search == selectedMenu
                    ? activeIconColor
                    : inActiveIconColor,
              ),
              //TODO: search page route
              onPressed: () => {},
            ),
            Obx(
              () => Badge(
                badgeContent: Text(
                  '${myCart.cartItems.length}',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                position: BadgePosition.topEnd(top: -5, end: -3),
                badgeColor: Colors.white,
                animationType: BadgeAnimationType.scale,
                child: IconButton(
                    icon: Icon(Icons.shopping_bag_outlined,
                        size: 28, color: Colors.white),
                    onPressed: () => {Get.toNamed("/cart")}),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.person_outline,
                  size: MenuState.profile == selectedMenu ? 30 : 25,
                  color: MenuState.profile == selectedMenu
                      ? activeIconColor
                      : inActiveIconColor,
                ),
                onPressed: () => Get.toNamed('/profile')),
          ],
        ),
      ),
    );
  }
}
