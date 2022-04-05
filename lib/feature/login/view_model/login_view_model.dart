import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/constants/app/application_constants.dart';
import '../../../core/constants/language/locale_keys.g.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../product/components/language/language_widget.dart';
import '../model/login_request.dart';
import '../service/i_login_service.dart';

class LoginViewModel extends BaseViewModel<ILoginService> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    logger.v('LoginViewModel initialize');
    emailController = TextEditingController();
    passwordController = TextEditingController();
    if (kDebugMode) {
      emailController.text = ApplicationConstants.loginPhoneNumber;
      passwordController.text = ApplicationConstants.loginPassword;
    }
  }

  Future<void> checkLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showFlushBar(message: LocaleKeys.general_all_valid_error.tr());
    } else if (!emailController.text.isValidEmail) {
      showFlushBar(message: LocaleKeys.login_view_login_valid_mail.tr());
    } else if (passwordController.text.length < 8) {
      showFlushBar(message: LocaleKeys.login_view_login_valid_password.tr());
    } else {
      await _login();
    }
  }

  void languageWidget() {
    showDialog(
      context: context,
      builder: (_) => const LanguageWidget(),
    );
  }

  Future<void> _login() async {
    try {
      setState(ViewState.Busy);
      final responseModel = await service.login(
        LoginRequest(
          mail: emailController.text,
          password: passwordController.text,
        ),
      );
      if (responseModel == null) {
        showFlushBar(
          message: LocaleKeys.login_view_login_request_error.tr(),
        );
      } else if (responseModel.token == null) {
        showFlushBar(
          message: LocaleKeys.login_view_login_request_login_error.tr(),
        );
      } else {
        signIn(responseModel.token!);
        context.navigateToReset(NavigationConstants.home);
      }
    } catch (e) {
      onCatchError(e);
    } finally {
      setState(ViewState.Idle);
    }
  }
}
