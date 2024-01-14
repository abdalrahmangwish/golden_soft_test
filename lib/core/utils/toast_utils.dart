import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';

class ToastUtils {
  static void showCenterShortToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorManager.primaryColor,
      textColor: ColorManager.white,
      fontSize: 16.0,
    );
  }
}