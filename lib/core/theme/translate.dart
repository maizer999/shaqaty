
import 'package:flutter/cupertino.dart';

import 'app_localization.dart';

extension TranslateString on String {
  String translate(BuildContext context) {
    return (AppLocalization.of(context)!.getTranslatedValues(this) ?? this)
        .trim();
  }
}
