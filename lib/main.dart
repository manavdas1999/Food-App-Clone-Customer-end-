// Main Screen from where all processes start.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_customer_app/theme.dart';
import 'package:get/get.dart';
import 'routes.dart';

late int initScreen;

Future main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodZee',
      theme: theme(),
      getPages: routes,
      initialRoute: "/onboarding",
    );
  }
}

