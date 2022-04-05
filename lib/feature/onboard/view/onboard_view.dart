import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/language/locale_keys.g.dart';
import '../view_model/onboard_view_model.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: context.dynamicWidth(0.5),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                Text(
                  LocaleKeys.onboard_view_onboard_text.tr(),
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
