import 'package:dartz/dartz.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/register_response.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/sub_category_entity.dart';
import 'package:golden_soft_test/features/register_technician/domain/repository/register_domain_repository.dart';


class GetSubCategoryUseCase {
  const GetSubCategoryUseCase(this.repository);

  final RegisterDomainRepository repository;

  Future<Either<String, List<SubCategoryEntity>>> call(int id) =>
      repository.getSubCategory(id);
}
