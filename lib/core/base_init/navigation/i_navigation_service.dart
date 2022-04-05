import 'package:flutter/material.dart';

abstract class INavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  bool removeAllOldRoutes(Route<dynamic> route) => false;

  Future<void> navigateToPage({String? path, Object? data});
  Future<void> navigateToPageClear({String? path, Object? data});
}
