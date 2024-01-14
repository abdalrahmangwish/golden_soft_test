import 'package:golden_soft_test/features/register_technician/domain/entity/name_entity.dart';
class NameModel extends Name{
  NameModel({required super.en, required super.ar, required super.ur});
  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      en: json['en'] ??"",
      ar: json['ar'] ??"",
      ur: json['ur']  ??"",
    );
  }

}