part of 'tec_bloc.dart';

@immutable
abstract class TecState {}

class TecInitial extends TecState {}

class RegisterLoading extends TecState {}

class RegisterError extends TecState {}

class RegisterComplete extends TecState {}

class GetCategoryLoading extends TecState {}

class GetCategoryComplete extends TecState {}

class GetCategoryError extends TecState {}

class GetSubCategoryLoading extends TecState {}

class GetSubCategoryComplete extends TecState {}

class GetSubCategoryError extends TecState {}

class RemoveSubCategoryLoading extends TecState {}

class RemoveSubCategoryLoaded extends TecState {}

class PickSubCategoryLoading extends TecState {}

class PickSubCategoryLoaded extends TecState {}
