import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../service/i_home_service.dart';

class HomeViewModel extends BaseViewModel<IHomeService> {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    logger.v('HomeViewModel initialize');
  }

  void exit() {
    signOut();
    context.navigateToReset(NavigationConstants.login);
  }
}
