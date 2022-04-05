import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/init/startup/startup_top.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel) onPageBuilder;
  final void Function(T viewModel) onModelReady;

  const BaseView({
    Key? key,
    required this.onPageBuilder,
    required this.onModelReady,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    viewModel = Startup.locator<T>();
    widget.onModelReady(viewModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ChangeNotifierProvider<T>.value(
        value: viewModel,
        child: widget.onPageBuilder(context, viewModel),
      ),
    );
  }
}
