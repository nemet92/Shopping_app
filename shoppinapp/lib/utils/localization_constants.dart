// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppinapp/demo_localization.dart';

//language code
const String ENGLSIH = "en";
const String TURKISH = "tr";

const String LANGUAGE_CODE = "languageCode";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(LANGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(LANGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLSIH:
      return Locale(languageCode, "US");
    case TURKISH:
      return Locale(languageCode, "TR");
    default:
      return const Locale(ENGLSIH, "US");
  }
  // return temp = Locale(languageCode, "TR");
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslatedValue(key);
}
