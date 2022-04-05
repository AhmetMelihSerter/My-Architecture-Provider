import 'package:vexana/vexana.dart';

import '../../../product/init/startup/startup_top.dart';

abstract class BaseService {
  late INetworkManager manager;

  final duration = const Duration(seconds: 1);

  BaseService() {
    manager = Startup.locator<INetworkManager>();
  }
}
