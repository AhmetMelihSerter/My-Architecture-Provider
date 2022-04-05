import 'package:vexana/vexana.dart';

abstract class ICoreNetworkManager extends INetworkManager {
  void signIn(String token);

  void signOut();
}
