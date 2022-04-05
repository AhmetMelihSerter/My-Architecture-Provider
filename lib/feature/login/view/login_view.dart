import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/constants/language/locale_keys.g.dart';
import '../../../product/components/progress_indicator/custom_progress_indicator.dart';
import '../../../product/components/sized_box/custom_sized_box.dart';
import '../../../product/components/text_field/custom_text_field.dart';
import '../view_model/login_view_model.dart';
import '../widget/login_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(viewModel),
          body: _buildBody(context, viewModel),
        );
      },
    );
  }

  AppBar _buildAppBar(LoginViewModel viewModel) {
    return AppBar(
      title: Text(LocaleKeys.login_view_login_app_bar_text.tr()),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.language,
            color: Colors.white,
          ),
          onPressed: viewModel.languageWidget,
        ),
      ],
    );
  }

  Widget _buildSpacer({double? width, double height = 0.1}) {
    return CustomSizedBox(
      width: width,
      height: height,
    );
  }

  Widget _buildCustomProgressIndicator() {
    return const CustomProgressIndicator();
  }

  Widget _buildBody(BuildContext context, LoginViewModel viewModel) {
    return SafeArea(
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => viewModel.state == ViewState.Busy
            ? _buildCustomProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSpacer(height: 0.09),
                    _buildLogo(context),
                    _buildSpacer(height: 0.03),
                    _buildMail(viewModel),
                    _buildSpacer(height: 0.01),
                    _buildPassword(viewModel),
                    _buildSpacer(height: 0.05),
                    _buildLoginButton(viewModel),
                    _buildSpacer(height: 0.05),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return FlutterLogo(
      size: context.dynamicWidth(0.3),
    );
  }

  Widget _buildMail(LoginViewModel viewModel) {
    return CustomTextField(
      controller: viewModel.emailController,
      labelText: LocaleKeys.login_view_login_email_label.tr(),
    );
  }

  Widget _buildPassword(LoginViewModel viewModel) {
    return CustomTextField(
      obscureText: true,
      controller: viewModel.passwordController,
      labelText: LocaleKeys.login_view_login_password_label.tr(),
    );
  }

  Widget _buildLoginButton(LoginViewModel viewModel) {
    return LoginButton(
      onPressed: viewModel.checkLogin,
    );
  }
}
