import 'dart:io';
import 'package:dio/dio.dart';

class RegisterTecParams {
  final String? email;
  final String? name;
  final String? password;
  final String? phone;
  final String? iban;
  final String? latitude;
  final String? longitude;
  final File? residencyPhoto;
  final File? photo;
  final String? bankName;
  final String? code;
  final String? subCategories;

  RegisterTecParams({
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
    required this.iban,
    required this.latitude,
    required this.longitude,
    required this.residencyPhoto,
    required this.photo,
    required this.bankName,
    required this.code,
    required this.subCategories,
  });

  FormData toFormData() {
    final formData = FormData();

    formData.fields
      ..add(MapEntry('email', email??""))
      ..add(MapEntry('name', name??""))
      ..add(MapEntry('password', password??""))
      ..add(MapEntry('phone', phone??""))
      ..add(MapEntry('iban', iban??""))
      ..add(MapEntry('latitude', latitude??""))
      ..add(MapEntry('longitude', longitude??""))
      ..add(MapEntry('bankName', bankName??""))
      ..add(MapEntry('code', code??""))
      ..add(MapEntry('subCategories', subCategories??""));

    if (residencyPhoto != null) {
      formData.files.add(MapEntry(
        'residencyPhoto',
        MultipartFile.fromFileSync(residencyPhoto!.path),
      ));
    }

    if (photo != null) {
      formData.files.add(MapEntry(
        'photo',
        MultipartFile.fromFileSync(photo!.path),
      ));
    }

    return formData;
  }
}
