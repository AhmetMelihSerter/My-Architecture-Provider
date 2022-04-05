import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomSizedBox extends StatelessWidget {
  final double? width;
  final double height;
  const CustomSizedBox({
    Key? key,
    this.width,
    this.height = 0.1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? context.dynamicWidth(width!) : width,
      height: context.dynamicHeight(height),
    );
  }
}
