import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../base_init/local/i_local_manager.dart';
import '../../../core/base_init/logger/i_logger_manager.dart';
import '../../../product/init/startup/startup_top.dart';
import '../../../product/init/theme/i_theme_manager.dart';
import '../../base_init/network/i_core_network_manager.dart';
import '../../constants/language/locale_keys.g.dart';
import '../service/base_service.dart';

enum ViewState { Idle, Busy }

abstract class BaseViewModel<T extends BaseService> extends ChangeNotifier {
  late BuildContext context;

  late final T service;

  late final ILoggerManager logger;

  late final NumberFormat currencyFilter;

  final locator = Startup.locator;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  BaseViewModel() {
    service = locator<T>();
    logger = locator<ILoggerManager>();
    currencyFilter = NumberFormat("#,##0.00", "tr_TR");
  }

  String currencyToString(double amount) {
    return currencyFilter.format(amount);
  }

  void setContext(BuildContext context);
  void init();

  Color get primaryVariant => locator<IThemeManager>().primaryVariant;

  Color get greyColor => locator<IThemeManager>().greyColor;

  void showFlushBar({
    String? message,
    FlushbarPosition position = FlushbarPosition.BOTTOM,
  }) {
    Flushbar(
      backgroundColor: primaryVariant,
      messageColor: Colors.white,
      message: message,
      messageSize: 16,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      animationDuration: context.durationLow,
      flushbarPosition: position,
    ).show(context);
  }

  void signIn(String token) {
    locator<ILocalManager>().signIn(token);
    locator<ICoreNetworkManager>().signIn(token);
  }

  void signOut() {
    locator<ILocalManager>().signOut();
    locator<ICoreNetworkManager>().signOut();
  }

  void onCatchError(Object e) {
    logger.e(LocaleKeys.general_error.tr(
      args: [
        e.toString(),
      ],
    ));
  }
}
