import 'package:flutter/widgets.dart';

import '../../../core/constants/language/locale_keys.g.dart';

class LanguageManager {
  final List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR'),
  ];

  final List<String> supportLanguageKey = [
    LocaleKeys.language_widget_language_english,
    LocaleKeys.language_widget_language_turkish,
  ];

  final Locale fallbackLocale = const Locale('en', 'US');
}
