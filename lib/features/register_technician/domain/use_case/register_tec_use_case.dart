import 'package:dartz/dartz.dart';
import 'package:golden_soft_test/core/params/reigster_tec_params.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/register_response.dart';
import 'package:golden_soft_test/features/register_technician/domain/repository/register_domain_repository.dart';


class RegisterTecUseCase {
  const RegisterTecUseCase(this.repository);

  final RegisterDomainRepository repository;

  Future<Either<String, RegisterResponseEntity>> call(RegisterTecParams params) =>
      repository.registerTec(params);
}
