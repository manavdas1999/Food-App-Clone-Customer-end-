// Defines the Sign-in Screens

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          // checks if user is already signed in or not
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // if yes then directly goes to HomeScreen
              return HomeScreen();
            }
            // if not then goes to sign-in screens
            return Body();
          }),
    );
  }
}
