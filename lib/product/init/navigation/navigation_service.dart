import '../../../core/base_init/navigation/i_navigation_service.dart';

class NavigationService extends INavigationService {
  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(
      path!,
      arguments: data,
    );
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path!,
      removeAllOldRoutes,
      arguments: data,
    );
  }
}
