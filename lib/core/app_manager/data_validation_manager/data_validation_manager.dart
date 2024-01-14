
import 'package:flutter/material.dart';

class DataValidationManager {
  static String? emailValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return "Email_is_required";
    }
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
      return 'Invalid email address';
    }

    return null;
  }

  static String? passwordValidation(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'Password_is_required';
    }
    if (value.length < 6) {
      return 'Password_must_be_at_least';
    }
    return null;
  }

  static String? globalDateValidation(
      String? value, BuildContext context, String name) {
    if (value == null || value.isEmpty) {
      return name + 'for_Date_is_required';
    }
    final dateFormat = RegExp(
      r'^\d{4}-\d{2}-\d{2}$',
    );
    if (!dateFormat.hasMatch(value)) {
      return 'Invalid_date_format';
    }
    try {
      final parsedDate = DateTime.parse(value);
    } catch (e) {
      return 'Invalid_Date';
    }
    return null;
  }

  static String? globalValidation(
      String? value, BuildContext context, String name) {
    if (value == null || value.isEmpty) {
      return name + 'is required';
    }
    if (value.length < 3) {
      return name + 'must_be_at_least_characters_long';
    }
    return null;
  }

  static String? globalEmptyNumberValidation(
    String? value,
    BuildContext context,
    String name,
  ) {
    if (value == null || value.isEmpty) {
      return name + 'is_required';
    }

    if (!RegExp(r'^[0-9]+(\.[0-9]+)?$').hasMatch(value)) {
      return name + 'must_contain_only_numbers';
    }

    return null;
  }

  static String? globalMobileNumberValidation(
    String? value,
    BuildContext context,
    String name,
  ) {
    if (value == null || value.isEmpty) {
      return name + 'is_required';
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return name + ' must contain only numbers';
    }

    if (value.length != 10) {
      return name + 'It_must_consist_of_ten_numbers';
    }

    return null;
  }
}
