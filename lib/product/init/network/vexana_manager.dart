import 'package:vexana/vexana.dart';

import '../../../core/base_init/logger/i_logger_manager.dart';
import '../../../core/base_init/navigation/i_navigation_service.dart';
import '../../../core/base_init/network/i_core_network_manager.dart';
import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../startup/startup_top.dart';

class VexanaManager extends NetworkManager implements ICoreNetworkManager {
  VexanaManager()
      : super(
          options: BaseOptions(
            baseUrl: ApplicationConstants.baseUrl,
          ),
          interceptor: InterceptorsWrapper(
            onRequest: (request, handler) {
              final _logger = Startup.locator<ILoggerManager>();
              _logger.v(
                  "Dio Url: ${request.baseUrl}${request.path}\nDio Method: ${request.method}\nDio Header: ${request.headers}\nDio Request: ${request.data}");
              handler.next(request);
            },
            onResponse: (response, handler) {
              final _logger = Startup.locator<ILoggerManager>();
              _logger.v(
                  "Dio Response: $response\nDio Headers: ${response.headers}\nDio Status Code: ${response.statusCode}\nDio Data: ${response.data}");
              handler.next(response);
            },
            onError: (error, handler) {
              if (error.response?.statusCode == 403 ||
                  error.response?.statusCode == 401) {
                Startup.locator<INavigationService>().navigateToPageClear(
                  path: NavigationConstants.login,
                );
              }
            },
          ),
        );

  @override
  void signIn(String token) {
    if (token.contains('Bearer')) {
      token = token.replaceAll('Bearer ', '');
    }
    final entry = MapEntry('Authorization', 'Bearer $token');
    addBaseHeader(entry);
  }

  @override
  void signOut() {
    removeHeader('Authorization');
  }
}
