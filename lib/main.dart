import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/base_init/navigation/i_navigation_service.dart';
import 'core/constants/app/application_constants.dart';
import 'product/init/language/language_manager.dart';
import 'product/init/navigation/navigation_router.dart';
import 'product/init/startup/startup_top.dart';
import 'product/init/theme/i_theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Startup.instance.initialize();
  runApp(
    EasyLocalization(
      supportedLocales: Startup.locator<LanguageManager>().supportedLocales,
      path: ApplicationConstants.LANGUAGE_ASSET_PATH,
      fallbackLocale: Startup.locator<LanguageManager>().fallbackLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationConstants.APP_NAME,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      navigatorKey: Startup.locator<INavigationService>().navigatorKey,
      theme: Startup.locator<IThemeManager>().theme,
      onGenerateRoute: Startup.locator<NavigationRouter>().onGenerateRoute,
    );
  }
}
