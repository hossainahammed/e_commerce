import 'package:e_commerce/features/auth/presentations/screens/verity_otp_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute (RouteSettings settings){
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
  return MaterialPageRoute(builder: (ctx)=>screen);
}
