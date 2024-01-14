import 'package:get_it/get_it.dart';
import 'package:golden_soft_test/features/register_technician/data/reomte/tec_remote_data_source.dart';
import 'package:golden_soft_test/features/register_technician/data/repositroy/register_tec_data_repository.dart';
import 'package:golden_soft_test/features/register_technician/domain/repository/register_domain_repository.dart';
import 'package:golden_soft_test/features/register_technician/domain/use_case/category_use_case.dart';
import 'package:golden_soft_test/features/register_technician/domain/use_case/register_tec_use_case.dart';
import 'package:golden_soft_test/features/register_technician/domain/use_case/sub_category_use_case.dart';
import 'package:golden_soft_test/features/register_technician/presentation/bloc/tec_bloc.dart';

final getIt = GetIt.asNewInstance();

void initializeGetIt() {
  // DataSource
  getIt
    ..registerSingleton(TecRemoteDataSource())
    //Repository
    ..registerSingleton<RegisterDomainRepository>(
      RegisterTecDataRepository(getIt()),
    )
    //UseCase
    ..registerSingleton(GetCategoryUseCase(getIt()))
    ..registerSingleton(RegisterTecUseCase(getIt()))
    ..registerSingleton(GetSubCategoryUseCase(getIt()))
    //Bloc
    ..registerSingleton(TecBloc(getIt(),getIt(),getIt()));
}
