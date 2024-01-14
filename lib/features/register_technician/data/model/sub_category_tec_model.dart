import 'package:golden_soft_test/core/global/model/name_model.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/sub_category_entity.dart';

class SubCategoryTecModel extends SubCategoryEntity {
  SubCategoryTecModel(
      {required super.id,
      required super.image,
      required super.name,
      required super.description,
      required super.postedAt});

  factory SubCategoryTecModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryTecModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      name: NameModel.fromJson(json['name'] ?? {}),
      description: NameModel.fromJson(json['description'] ?? {}),
      postedAt: json['Posted at'] ?? '',
    );
  }
}
