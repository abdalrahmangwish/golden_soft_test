import 'package:flutter/material.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/app_manager/font_manager/font_manager.dart';

class AppInputField extends StatefulWidget {
  const AppInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.isRequired,
    this.isPassword = false,
    this.readOnly = false,
    this.onChange,
    this.keyboardType,
    this.prefix,
    this.hintStyelyText,
    this.suffix,
    this.labelColor,
    this.fieldHeight,
    this.validator,
    this.isDense,
    this.height,
    this.focusNode,
    this.fillColor,
    this.onTap,
    this.vertical,
    this.isNumber,
    this.bottom,
    this.numberInput,
    this.initialValue,
    this.maxLines = 1,
  });

  final void Function()? onTap;
  final bool readOnly;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextStyle? hintStyelyText;
  final bool isRequired;
  final double? height;
  final int? numberInput;
  final Widget? prefix;
  final Widget? suffix;
  final double? fieldHeight;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final bool? isDense;
  final bool isPassword;
  final FocusNode? focusNode;
  final Color? fillColor;
  final Color? labelColor;
  final double? vertical;
  final double? bottom;
  final bool? isNumber;
  final void Function(String value)? onChange;
  final String? initialValue;
  final int maxLines;

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  late bool obscure = widget.isPassword;
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          onChanged: (value) => widget.onChange?.call(value),
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          onFieldSubmitted: (value) {
            _focusNode.nextFocus();
          },
          obscureText: obscure,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            fillColor: ColorManager.white,
            filled: true,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: obscure
                  ? const Icon(
                Icons.remove_red_eye,
                color: ColorManager.darkGrey,
              )
                  : const Icon(Icons.panorama_fish_eye),
              onPressed: () {
                setState(() {
                  obscure = !obscure;
                });
              },
            )
                : widget.suffix,
            prefixIcon: widget.prefix,
            hintText: widget.hintText,
            hintStyle: FontManager.defaultTextField,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: ColorManager.greyColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ColorManager.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ColorManager.greyColor,
              ),
            ),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
