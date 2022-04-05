import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/base_init/secure/i_secure_manager.dart';
import '../startup/startup_top.dart';
import '../../../core/base_init/local/i_local_manager.dart';

class HiveManager extends ILocalManager {
  final String _tokenBoxName = 'tokenBox';

  @override
  Future<void> initialize() async {
    final key = await Startup.locator<ISecureManager>().readKey();

    await Hive.openBox<String>(
      _tokenBoxName,
      encryptionCipher: HiveAesCipher(key),
    );
  }

  Box<String> get _getTokenBox => Hive.box<String>(_tokenBoxName);

  @override
  String? getToken() {
    return _getTokenBox.get(tokenKeyName);
  }

  @override
  void signIn(String token) {
    _getTokenBox.put(tokenKeyName, token);
  }

  @override
  void signOut() {
    _getTokenBox.delete(tokenKeyName);
  }
}
