//Defines the Controller object for Payment Gateway

// NOTE: RazorPay Payment gateway(Test Mode) is used in the project

import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../screens/cart/components/post_payment.dart';

class PaymentController extends GetxController {
  var razorpay = Razorpay();

  @override
  void onInit() {
    // event listeners for razorpay
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  @override
  void onClose() {
    // Removes all listeners
    razorpay.clear();
    super.onClose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.to(PostPaymentScreen(
      isSuccess: true,
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.to(PostPaymentScreen(
      isSuccess: false,
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
}
