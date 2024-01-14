import 'package:dartz/dartz.dart';
import 'package:golden_soft_test/core/params/reigster_tec_params.dart';
import 'package:golden_soft_test/features/register_technician/data/reomte/tec_remote_data_source.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/category_tec_entity.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/register_response.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/sub_category_entity.dart';
import 'package:golden_soft_test/features/register_technician/domain/repository/register_domain_repository.dart';

class RegisterTecDataRepository implements RegisterDomainRepository {
  TecRemoteDataSource tecRemoteDataSource;
  RegisterTecDataRepository(this.tecRemoteDataSource);
  @override
  Future<Either<String, List<CategoryTecEntity>>> getCategory() async {
    try {
      final category = await tecRemoteDataSource.getCategory();
      return Right(category);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<SubCategoryEntity>>> getSubCategory(id) async {
    try {
      final category = await tecRemoteDataSource.getSubCategory(id);
      return Right(category);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, RegisterResponseEntity>> registerTec(
      RegisterTecParams params)async {
    try {
      final response = await tecRemoteDataSource.registerTec(params);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }  }
}
