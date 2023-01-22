// Model Class for Cart Object

import 'package:get/get.dart';
import 'Food.dart';

class Cart extends GetxController {
  var cartItems = <Food>[].obs;

  double get total {
    return cartItems.fold(0.0, (double currentTotal, Food nextProduct) {
      return currentTotal + double.parse(nextProduct.price);
    });
  }

  void addToCart(Food product) {
    if (cartItems.contains(product)) {
      // increase count
    } else {
      cartItems.add(product);
    }
  }

  void removeFromCart(Food product) {
    cartItems.remove(product);
  }
}
