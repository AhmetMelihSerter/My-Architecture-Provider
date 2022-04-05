import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/language/locale_keys.g.dart';
import '../../../product/components/button/custom_elevated_button.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;

  const LoginButton({
    Key? key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.4),
      height: context.dynamicHeight(0.08),
      child: CustomElevatedButton(
        onPressed: onPressed,
        child: Text(
          LocaleKeys.login_view_login_button_label.tr(),
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
