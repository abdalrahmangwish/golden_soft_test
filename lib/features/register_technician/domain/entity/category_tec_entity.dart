import 'package:golden_soft_test/features/register_technician/domain/entity/name_entity.dart';
import 'package:json_annotation/json_annotation.dart';

class CategoryTecEntity {
  @JsonKey(name: CategoryEntityKeys.id)
  final int id;
  @JsonKey(name: CategoryEntityKeys.image)
  final String image;
  @JsonKey(name: CategoryEntityKeys.name)
  final Name name;
  @JsonKey(name: CategoryEntityKeys.postedAt)
  final String postedAt;

  CategoryTecEntity({required this.id, required this.image, required this.name, required this.postedAt});
}

class CategoryEntityKeys{
  static const String image = 'image';
  static const String id = 'id';
  static const String name ='name';
  static const String postedAt ='Posted at';
}