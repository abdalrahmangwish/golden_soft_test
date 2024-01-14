import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:golden_soft_test/core/params/reigster_tec_params.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/category_tec_entity.dart';
import 'package:golden_soft_test/features/register_technician/domain/entity/sub_category_entity.dart';
import 'package:golden_soft_test/features/register_technician/domain/use_case/category_use_case.dart';
import 'package:golden_soft_test/features/register_technician/domain/use_case/register_tec_use_case.dart';
import 'package:golden_soft_test/features/register_technician/domain/use_case/sub_category_use_case.dart';
import 'package:meta/meta.dart';

part 'tec_event.dart';
part 'tec_state.dart';

class TecBloc extends Bloc<TecEvent, TecState> {
  TecBloc(this.getSubCategoryUseCase, this.registerTecUseCase,
      this.getCategoryUseCase)
      : super(TecInitial()) {
    on<RegisterTecEvent>((event, emit) => _mapRegisterTecEvent(event, emit));
    on<CategoryTecEvent>((event, emit) => _mapCategoryTecEvent(event, emit));
    on<SubCategoryTecEvent>(
        (event, emit) => _mapSubCategoryTecEvent(event, emit));
    on<PickSubCategoryEvent>(
        (event, emit) => _mapPickSubCategoryTecEvent(event, emit));
    on<RemoveSubCategoryEvent>(
        (event, emit) => _mapRemoveSubCategoryTecEvent(event, emit));
  }
  final GetCategoryUseCase getCategoryUseCase;
  final GetSubCategoryUseCase getSubCategoryUseCase;
  final RegisterTecUseCase registerTecUseCase;
  List<CategoryTecEntity> category = [];
  List<SubCategoryEntity> subCategory = [];
  Set<SubCategoryEntity> selectedSubCategory = {};
  CategoryTecEntity? selectedCategory;
  double? selectedLongitude , selectedLatitude;
  File ?avatarPhoto;

  void _mapRegisterTecEvent(
      RegisterTecEvent event, Emitter<TecState> emit) async {
    emit(RegisterLoading());
    try {
      await registerTecUseCase.call(event.registerTecParams);
      emit(RegisterComplete());
    } catch (error) {
      emit(RegisterError());
    }
  }

  void _mapCategoryTecEvent(
      CategoryTecEvent event, Emitter<TecState> emit) async {
    emit(GetCategoryLoading());
    try {
      final categoriesEither = await getCategoryUseCase.call();
      categoriesEither.fold(
        (error) => emit(GetCategoryError()),
        (categories) {
          category.clear();
          category.addAll(categories);
          emit(GetCategoryComplete());
        },
      );
    } catch (error) {
      emit(GetCategoryError());
    }
  }

  void _mapPickSubCategoryTecEvent(
      PickSubCategoryEvent event, Emitter<TecState> emit) async {
    emit(PickSubCategoryLoading());
    selectedSubCategory.addAll(event.entities);
    emit(PickSubCategoryLoaded());
  }

  void _mapRemoveSubCategoryTecEvent(
      RemoveSubCategoryEvent event, Emitter<TecState> emit) async {
    emit(RemoveSubCategoryLoading());
    try {
      SubCategoryEntity index =
          selectedSubCategory.firstWhere((element) => element.id == event.id);
      selectedSubCategory.remove(index);
    } catch (e) {
      if (kDebugMode) {
        print("an error was thrown");
      }
    }
    emit(RemoveSubCategoryLoaded());
  }

  void _mapSubCategoryTecEvent(
      SubCategoryTecEvent event, Emitter<TecState> emit) async {
    emit(GetSubCategoryLoading());
    try {
      final subCategoriesEither =
          await getSubCategoryUseCase(event.categoryTecEntity.id);

      subCategoriesEither.fold(
        (error) => emit(GetSubCategoryError()),
        (subCategories) {
          subCategory.clear();
          subCategory.clear();
          selectedSubCategory.clear();
          selectedCategory = event.categoryTecEntity;
          subCategory.addAll(subCategories);
          emit(GetSubCategoryComplete());
        },
      );
    } catch (error) {
      emit(GetSubCategoryError());
    }
  }
}
