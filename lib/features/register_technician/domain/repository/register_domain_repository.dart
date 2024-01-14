import 'package:dartz/dartz.dart';
import 'package:golden_soft_test/core/params/reigster_tec_params.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/category_tec_entity.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/register_response.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/sub_category_entity.dart';

abstract class RegisterDomainRepository {
  Future<Either<String,RegisterResponseEntity>> registerTec(RegisterTecParams params);
  Future<Either<String,List<CategoryTecEntity>>> getCategory();
  Future<Either<String,List<SubCategoryEntity>>> getSubCategory(int id );

}