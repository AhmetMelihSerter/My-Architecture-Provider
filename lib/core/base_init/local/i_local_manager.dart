abstract class ILocalManager {
  final String tokenKeyName = 'token';

  Future<void> initialize();

  String? getToken();

  void signIn(String token);
  void signOut();
}
