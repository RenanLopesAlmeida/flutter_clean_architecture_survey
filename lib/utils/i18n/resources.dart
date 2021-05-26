import 'package:flutter/widgets.dart';

import 'strings/strings.dart';

class R {
  static Translations strings = _availableLanguages['en_US'];

  static void load(Locale locale) {
    strings = !_availableLanguages.containsKey(locale.toString())
        ? EnUs()
        : _availableLanguages[locale.toString()];
  }

  static Map<String, dynamic> get _availableLanguages => {
        'en_US': EnUs(),
        'pt_BR': PtBr(),
      };
}
