
import 'package:flutter/material.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/constant/assets.dart';

class FontManager {
  static  const TextStyle  defaultTextField = TextStyle(
    fontSize: 13.0,
    color: ColorManager.greyColor,
    fontWeight: FontWeight.w400,
    fontFamily: Assets.arabicFont,
  );
  static  const TextStyle  titleText = TextStyle(
    fontSize: 18.0,
    color: ColorManager.blackTitle,
    fontWeight: FontWeight.w400,
    fontFamily: Assets.arabicFont,
  );
  static  const TextStyle  titleTextPrimary = TextStyle(
    fontSize: 18.0,
    color: ColorManager.primaryColor,
    fontWeight: FontWeight.w400,
    fontFamily: Assets.arabicFont,
  );

  static  const TextStyle  itemFonts = TextStyle(
    fontSize: 12.0,
    color: ColorManager.white,
    fontWeight: FontWeight.w400,
    fontFamily: Assets.arabicFont,
  );



}
