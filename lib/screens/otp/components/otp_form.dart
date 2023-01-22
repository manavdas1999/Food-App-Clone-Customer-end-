//Defines the OTP form and validations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_customer_app/components/default_button.dart';
import 'package:food_customer_app/size_config.dart';

import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final verificationId = Get.arguments[0];

  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  TextEditingController _pin1 = TextEditingController();
  TextEditingController _pin2 = TextEditingController();
  TextEditingController _pin3 = TextEditingController();
  TextEditingController _pin4 = TextEditingController();
  TextEditingController _pin5 = TextEditingController();
  TextEditingController _pin6 = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();

    _pin1.dispose();
    _pin2.dispose();
    _pin3.dispose();
    _pin4.dispose();
    _pin5.dispose();
    _pin6.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _pin1,
                  autofocus: true,
                  style: TextStyle(fontSize: 22),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _pin2,
                  focusNode: pin2FocusNode,
                  style: TextStyle(fontSize: 22),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _pin3,
                  focusNode: pin3FocusNode,
                  style: TextStyle(fontSize: 22),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _pin4,
                  focusNode: pin4FocusNode,
                  style: TextStyle(fontSize: 22),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin5FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _pin5,
                  focusNode: pin5FocusNode,
                  style: TextStyle(fontSize: 22),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin6FocusNode),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  controller: _pin6,
                  focusNode: pin6FocusNode,
                  style: TextStyle(fontSize: 22),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin6FocusNode!.unfocus();
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () async {
              // wrapping pins into a single code
              String code = _pin1.text +
                  _pin2.text +
                  _pin3.text +
                  _pin4.text +
                  _pin5.text +
                  _pin6.text;
              // Checking the sms code
              try {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: code);
                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
                // on success, goes to success screen
                Get.offNamed("/login_success");
              } on FirebaseAuthException catch (error) {
                Get.defaultDialog(
                  title: 'FoodZee',
                  titleStyle: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                  middleText: error.message.toString(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
