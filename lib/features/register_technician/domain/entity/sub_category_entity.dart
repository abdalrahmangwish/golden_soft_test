import 'package:golden_soft_test/core/app_manager/converter/converter.dart';
import 'package:golden_soft_test/core/global/model/name_model.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/name_entity.dart';
import 'package:json_annotation/json_annotation.dart';

class SubCategoryEntity {
  final int? id;

  final String ?image;

  final Name ?name;

  final Name ?description;

  final String? postedAt;

  SubCategoryEntity( {
    required this.id,
    required this.image,
    required  this.name,
    required this.description,
    required this.postedAt,
  }) ;
}

