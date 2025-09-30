import 'package:e_commerce/features/auth/presentations/screens/sign_in_screen.dart';
import 'package:e_commerce/features/auth/presentations/screens/sign_up_screen.dart';
import 'package:e_commerce/features/auth/presentations/screens/splash_screen.dart';
import 'package:e_commerce/features/auth/presentations/screens/verity_otp_screen.dart';
import 'package:e_commerce/features/products/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../features/shared/presentations/screens/bottom_nav_holder_screen.dart';

MaterialPageRoute onGenerateRoute (RouteSettings settings){
  late Widget screen;
  if(settings.name==SplashScreen.name){
    screen = SplashScreen();
  }
  else if (settings.name == SignInScreen.name){
    screen = SignInScreen();
  }
  else if (settings.name == SignUpScreen.name){
    screen = SignUpScreen();
  }
  else if (settings.name == VerifyOtpScreen.name){
    screen = VerifyOtpScreen();
  }
  else if (settings.name == BottomNavHolderScreen.name){
    screen = BottomNavHolderScreen();
  }
  else if (settings.name == ProductListScreen.name){
     final String category = settings.arguments as String ;
    screen = ProductListScreen(categoryName: category,);
  }
  return MaterialPageRoute(builder: (ctx)=>screen);
}
