import 'package:flutter/material.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/extention/context_extension.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.fontSize,
    this.widthFactor = 0.8,
    this.heightFactor = 0.08,
    this.borderRadius = 8,
    this.onPressed,
    this.style,
    this.backgroundColor,
    this.textColor,
    this.fontWeight,
  });

  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final ButtonStyle? style;
  final String text;
  final double widthFactor;
  final double heightFactor;
  final double borderRadius;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(widthFactor),
      height: context.height(heightFactor),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextButton(
        style: style,
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? ColorManager.white,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
