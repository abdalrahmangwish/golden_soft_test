import 'package:golden_soft_test/core/app_manager/converter/converter.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Name {
  @JsonKey(
    name: NameEntityKeys.en,
    fromJson: Converter.toValidateString,
  )
  final String en;
  @JsonKey(
    name: NameEntityKeys.ar,
    fromJson: Converter.toValidateString,
  )
  final String ar;
  @JsonKey(
    name: NameEntityKeys.ur,
    fromJson: Converter.toValidateString,
  )
  final String ur;

  Name({
    required this.en,
    required this.ar,
    required this.ur,
  });
}

class NameEntityKeys {
  static const String en = 'en';
  static const String ur = 'ur';
  static const String ar = 'ar';
}
