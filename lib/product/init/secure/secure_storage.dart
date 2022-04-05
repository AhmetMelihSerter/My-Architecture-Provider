import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

import '../../../core/base_init/secure/i_secure_manager.dart';
import '../../../core/constants/app/application_constants.dart';

class SecureStorage extends ISecureManager {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> initialize() async {
    bool checkKey = await _secureStorage.containsKey(
      key: ApplicationConstants.secureKey,
    );
    if (!checkKey) {
      await createKey();
    }
  }

  @override
  Future<void> createKey() async {
    final key = Hive.generateSecureKey();
    await _secureStorage.write(
      key: ApplicationConstants.secureKey,
      value: base64Url.encode(key),
    );
  }

  @override
  Future<List<int>> readKey() async {
    String? key = await _secureStorage.read(
      key: ApplicationConstants.secureKey,
    );
    if (key == null) {
      throw Exception("Secure key not found.");
    }
    return base64Url.decode(key);
  }
}
