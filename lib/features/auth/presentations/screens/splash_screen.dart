import 'package:e_commerce/app/asset_paths.dart';
import 'package:e_commerce/app/controllers/auth_controller.dart';
import 'package:e_commerce/app/extensions/localization_extension.dart';
import 'package:e_commerce/app/utils/app_version_service.dart';
import 'package:e_commerce/features/auth/presentations/screens/sign_up_screen.dart';
import 'package:e_commerce/features/auth/presentations/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name ='/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();

  }
 Future<void> _moveToNextScreen()async{
    await Future.delayed(Duration(seconds:2 ));
    bool isUserLoggedIn = await Get.find<AuthController>().isUserAlreadyLoggedIn();
   if (isUserLoggedIn){
     await  Get.find<AuthController>().loadUserData();
   }

    Navigator.pushReplacementNamed(context, SignUpScreen.name);
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
            AppLogo(),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox(height: 12,),
              Text(
                '${context.localization.version} '
                    '${AppVersionService.currentAppVersion}',
              ),



              // Text(context.localization.hello),
             //LanguageChangeSwitch(),
            ],
          ),
        ),
      ),
    );
  }
}

