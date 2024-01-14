part of 'tec_bloc.dart';

@immutable
abstract class TecEvent {}

class RegisterTecEvent extends TecEvent {
  final RegisterTecParams registerTecParams;
  RegisterTecEvent(this.registerTecParams);
}

class CategoryTecEvent extends TecEvent {}

class PickSubCategoryEvent extends TecEvent {
  final List<SubCategoryEntity> entities;

  PickSubCategoryEvent({required this.entities});
}

class RemoveSubCategoryEvent extends TecEvent {
  final int id;

  RemoveSubCategoryEvent({required this.id});
}

class SubCategoryTecEvent extends TecEvent {
  final CategoryTecEntity categoryTecEntity;
  SubCategoryTecEvent(this.categoryTecEntity);
}
