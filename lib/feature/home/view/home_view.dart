import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/enums/app_enum.dart';
import '../../../core/constants/language/locale_keys.g.dart';
import '../../../product/components/sized_box/custom_sized_box.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, viewModel) {
        return Scaffold(
          appBar: _buildAppBar(viewModel),
          body: _buildBody(),
        );
      },
    );
  }

  AppBar _buildAppBar(HomeViewModel viewModel) {
    return AppBar(
      title: Text(LocaleKeys.home_view_home_app_bar_text.tr()),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.exit_to_app_outlined,
            color: Colors.white,
          ),
          onPressed: viewModel.exit,
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

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSpacer(),
            _buildLogo(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: Image.asset(
        ImageEnum.Home.path,
      ),
    );
  }
}
