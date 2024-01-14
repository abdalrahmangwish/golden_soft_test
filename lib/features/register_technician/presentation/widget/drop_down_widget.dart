import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/app_manager/data_validation_manager/data_validation_manager.dart';
import 'package:golden_soft_test/core/app_manager/service_locator/injection.dart';
import 'package:golden_soft_test/features/register_technician/presentation/bloc/tec_bloc.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 8),
      child: SizedBox(
        height: 55,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder(
            bloc: getIt<TecBloc>(),
            buildWhen: (previous, current) {
              if (current is GetCategoryComplete) return true;
              return false;
            },
            builder: (context, state) {
              return CustomDropdown<String>(
                validator: (value) {
                  return DataValidationManager
                      .globalValidation(
                      value, context, "public service");
                },
                hintText: 'الخدمة العامة',
                items: getIt<TecBloc>().category.isEmpty
                    ? ["item"]
                    : getIt<TecBloc>()
                    .category
                    .map((e) => e.name.ar)
                    .toList(),
                decoration: CustomDropdownDecoration(
                    searchFieldDecoration:
                    const SearchFieldDecoration(
                        textStyle:
                        TextStyle(fontSize: 13)),
                    hintStyle: const TextStyle(
                        color: ColorManager.greyColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                    closedBorder: Border.all(
                      color: ColorManager.greyColor,
                    ),
                    closedFillColor: ColorManager.white,
                    closedBorderRadius:
                    BorderRadius.circular(5)),
                onChanged: (value) {
                  int index = getIt<TecBloc>()
                      .category
                      .indexWhere((element) =>
                  element.name.ar == value);
                  if (index != -1) {
                    getIt<TecBloc>().add(SubCategoryTecEvent(
                        getIt<TecBloc>().category[index]));
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
