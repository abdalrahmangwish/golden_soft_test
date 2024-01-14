import 'package:golden_soft_test/features/register_technician/domain/entity/register_response.dart';

class RegisterResponseModel extends RegisterResponseEntity {
    RegisterResponseModel({
        required id,
        required photo,
        required name,
        required email,
        required phone,
        required iban,
        required status,
        required latitude,
        required longitude,
        required language,
        required subCategories,
    }) : super(
        id: id,
        photo: photo,
        name: name,
        email: email,
        phone: phone,
        iban: iban,
        status: status,
        latitude: latitude,
        longitude: longitude,
        language: language,
        subCategories: subCategories,
    );

    factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
        return RegisterResponseModel(
            id: json['id'],
            photo: json['photo'],
            name: json['name'],
            email: json['email'],
            phone: json['phone'],
            iban: json['iban'],
            status: json['status'],
            latitude: json['latitude'],
            longitude: json['longitude'],
            language: json['language'],
            subCategories: json['subCategories'],
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'photo': photo,
            'name': name,
            'email': email,
            'phone': phone,
            'iban': iban,
            'status': status,
            'latitude': latitude,
            'longitude': longitude,
            'language': language,
            'subCategories': subCategories,
        };
    }
}
