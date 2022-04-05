import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../enums/app_enum.dart';

class ApplicationConstants {
  ApplicationConstants._();

  static const APP_NAME = 'My Architecture Mobx';
  static const LANGUAGE_ASSET_PATH = 'assets/language';
  static const COMPANY_NAME = 'My Company';

  static AppMode get appMode =>
      kReleaseMode ? AppMode.Release : AppMode.FakeService;

  static get baseUrl => appMode == AppMode.Release ? _releaseUrl : _debugUrl;

  static String get secureKey => dotenv.get('SECURE_KEY');

  static String get _debugUrl => dotenv.get('DEBUG_URL');

  static String get _releaseUrl => dotenv.get('RELEASE_URL');

  static String get loginPhoneNumber => dotenv.get('LOGIN_PHONE_NUMBER');

  static String get loginPassword => dotenv.get('LOGIN_PASSWORD');
}
