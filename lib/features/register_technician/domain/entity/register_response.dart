import 'package:golden_soft_test/features/register_technician/domain/entity/sub_category_entity.dart';

class RegisterResponseEntity {
  final int? id;
  final String? photo;
  final String? name;
  final String? email;
  final String? phone;
  final String? iban;
  final String? status;
  final String? latitude;
  final String? longitude;
  final String? language;
  final List<SubCategoryEntity>? subCategories;

  RegisterResponseEntity(
      {required this.id,
      required this.photo,
      required this.name,
      required this.email,
      required this.phone,
      required this.iban,
      required this.status,
      required this.latitude,
      required this.longitude,
      required this.language,
      required this.subCategories});
}
