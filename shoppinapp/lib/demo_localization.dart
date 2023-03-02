import 'package:flutter/material.dart';

class DemoLocalization {
  final Locale local;

  DemoLocalization(this.local);

  static DemoLocalization of(BuildContext context) {
    return Localizations.of<DemoLocalization>(context, DemoLocalization)!;
  }

  Map<String, String>? _localizedValues;
}
