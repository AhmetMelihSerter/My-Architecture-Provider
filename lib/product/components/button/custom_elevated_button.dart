import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Widget? child;

  const CustomElevatedButton({
    Key? key,
    this.onPressed,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color?>(
          color,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
