import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalization {
  DemoLocalization(this.locale);

  final Locale locale;

  static DemoLocalization? of(BuildContext context) =>
      Localizations.of<DemoLocalization>(context, DemoLocalization);

  Map<String, String>? _localizedValues;

  Future<void> load() async {
    String jsonStringValues =
        await rootBundle.loadString("assets/i18n/${locale.languageCode}.json");
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String key) {
    return _localizedValues?[key] ?? key;
  }

  //Start
  static const LocalizationsDelegate<DemoLocalization> delegate =
      _DemoLocalizationsDelegate();
}

class _DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalization> {
  const _DemoLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ["en", "tr"].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) async {
    DemoLocalization localization = DemoLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_DemoLocalizationsDelegate old) => false;
}
