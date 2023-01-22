// All named (in string form) routes for different screens

import 'package:get/get.dart';
// Screen Named Imports
import 'screens/cart/cart_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/login_success/login_success_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/home/components/restrauntListView.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/splash/splash_screen.dart';

//Named routes
final List<GetPage<dynamic>>? routes = [
  GetPage(name: "/splash", page: () => SplashScreen()),
  GetPage(name: "/onboarding", page: () => OnboardingScreen()),
  GetPage(name: "/sign_in", page: () => SignInScreen()),
  GetPage(name: "/forgot_password", page: () => ForgotPasswordScreen()),
  GetPage(name: "/login_success", page: () => LoginSuccessScreen()),
  GetPage(name: "/sign_up", page: () => SignUpScreen()),
  GetPage(name: "/complete_profile", page: () => CompleteProfileScreen()),
  GetPage(name: "/otp", page: () => OtpScreen()),
  GetPage(name: "/home", page: () => HomeScreen()),
  GetPage(name: "/profile", page: () => ProfileScreen()),
  GetPage(name: "/cart", page: () => CartScreen()),
  GetPage(name: "/restaurants", page: () => RestaurantList()),
];
