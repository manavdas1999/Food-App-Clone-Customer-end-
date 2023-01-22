//Defines the main Home Screen of the app

import 'package:flutter/material.dart';
import 'package:food_customer_app/components/appbar.dart';
import 'package:food_customer_app/components/custom_bottom_nav_bar.dart';
import 'package:food_customer_app/constants.dart';
import 'package:food_customer_app/controllers/foodcontroller.dart';
import 'package:food_customer_app/enums.dart';
import 'package:get/get.dart';
import '../../controllers/restaurantcontroller.dart';
import '../../models/Cart.dart';
import 'components/body.dart';
import 'package:food_customer_app/helpers/address.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // initiating controllers
  final FoodController foodController = Get.put(FoodController());
  final RestaurantController restaurantController =
      Get.put(RestaurantController());
  final Cart myCart = Get.put(Cart());

  bool isLoading = false;

  List<String> currentAddress = [];
  @override
  void initState() {
    fetchAddress();
    super.initState();
  }

  void fetchAddress() async {
// fetches user address from GPS and manages loading screen
    setState(() {
      isLoading = true;
    });

    currentAddress = await getAddress();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            color: Colors.white,
            child: Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            )))
        : Scaffold(
            appBar: myAppBar(currentAddress, () {
              fetchAddress();
            }),
            body: Body(),
            bottomNavigationBar:
                CustomBottomNavBar(selectedMenu: MenuState.home),
          );
  }
}
