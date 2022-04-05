import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/language/locale_keys.g.dart';
import '../../init/language/language_manager.dart';
import '../../init/startup/startup_top.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      title: Text(LocaleKeys.language_widget_title.tr()),
      content: SizedBox(
        width: context.dynamicWidth(0.7),
        height: context.dynamicHeight(0.3),
        child: ListView.builder(
          itemCount: Startup.locator<LanguageManager>().supportedLocales.length,
          itemBuilder: (context, index) {
            final locale =
                Startup.locator<LanguageManager>().supportedLocales[index];
            final languageName =
                Startup.locator<LanguageManager>().supportLanguageKey[index];
            return ListTile(
              title: Text(languageName.tr()),
              onTap: () async {
                await context.setLocale(locale);
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
    );
  }
}
