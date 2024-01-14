import 'package:dartz/dartz.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/category_tec_entity.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/register_response.dart';
import 'package:golden_soft_test/features/register_technician/domain/repository/register_domain_repository.dart';


class GetCategoryUseCase {
  const GetCategoryUseCase(this.repository);

  final RegisterDomainRepository repository;

  Future<Either<String, List<CategoryTecEntity>>> call() =>
      repository.getCategory();
}
