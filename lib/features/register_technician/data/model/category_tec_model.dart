import 'package:golden_soft_test/core/global/model/name_model.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/category_tec_entity.dart';
import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
class CategoryTecModel extends CategoryTecEntity{
  CategoryTecModel({required super.id, required super.image, required super.name, required super.postedAt});
  factory CategoryTecModel.fromJson(Map<String, dynamic> json) {
    return CategoryTecModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      name: NameModel.fromJson(json['name'] ?? {}),
      postedAt: json['Posted at'] ?? '',
    );
  }
}