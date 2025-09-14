import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController{
  Locale _currentLocale = Locale('en');

  List<Locale> _supportedLocales =[
    Locale('en'), // English
    Locale('bn'), // Bangla
  ];

  Locale get currentLocale => _currentLocale;

  List<Locale>get supportedLocales => _supportedLocales;
  void changeLocale(Locale locale){
    if (_currentLocale == locale){
      return;
    }
    _currentLocale = locale;
    update();
  }
}