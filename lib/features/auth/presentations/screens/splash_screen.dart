import 'package:e_commerce/app/extensions/localization_extension.dart';
import 'package:e_commerce/features/shared/presentations/widgets/language_change_switch.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:e_commerce/l10n/app_localizations_en.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.localization.hello),
            LanguageChangeSwitch(),
          ],
        ),
      ),
    );
  }
}
