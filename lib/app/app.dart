import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/app_theme.dart';
import 'package:e_commerce/app/controllers/language_controller.dart';
import 'package:e_commerce/features/auth/presentations/screens/sign_in_screen.dart';
import 'package:e_commerce/features/auth/presentations/screens/sign_up_screen.dart';
import 'package:e_commerce/features/auth/presentations/screens/splash_screen.dart';
import 'package:e_commerce/features/auth/presentations/screens/verity_otp_screen.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  static final LanguageController languageController = LanguageController();
  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: analytics);




  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CraftyBay.languageController,
        builder: (languageController){


    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate, // Add your generated localization delegate here
      ],
      supportedLocales: languageController.supportedLocales,
      navigatorObservers: [observer],
      locale: languageController.currentLocale,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      themeMode: ThemeMode.light,
      home:SplashScreen(),
      initialRoute: SplashScreen.name,
      onGenerateRoute: (settings){
      }
    );
    });
  }
}



