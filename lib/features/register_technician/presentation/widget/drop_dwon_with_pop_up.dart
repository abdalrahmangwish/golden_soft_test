import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/app_manager/font_manager/font_manager.dart';
import 'package:golden_soft_test/core/app_manager/service_locator/injection.dart';
import 'package:golden_soft_test/core/constant/assets.dart';
import 'package:golden_soft_test/core/global/app_input_field.dart';
import 'package:golden_soft_test/core/utils/toast_utils.dart';
import 'package:golden_soft_test/features/register_technician/presentation/bloc/tec_bloc.dart';
import 'package:golden_soft_test/features/register_technician/presentation/params/registerParams.dart';
import 'package:golden_soft_test/features/register_technician/presentation/widget/sub_service_widget.dart';

class DropDownWithPopUp extends StatelessWidget {
  DropDownWithPopUp({Key? key}) : super(key: key);
  RegisterInterfaceParams registerInterfaceParams = RegisterInterfaceParams();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder(
          bloc: getIt<TecBloc>(),
          buildWhen: (previous, current) {
            if (current is GetSubCategoryComplete) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            return AppInputField(
              controller: registerInterfaceParams.subServiceController,
              hintText: "الخدمة الفرعية",
              labelText: "",
              readOnly: true,
              isRequired: false,
              suffix: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: ColorManager.greyColor,
              ),
              prefix: Image.asset(Assets.subServiceImage),
              onTap: () {
                if (getIt<TecBloc>().subCategory.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return MyPopup(
                        subCategory: getIt<TecBloc>().subCategory,
                        onItemSelected: (item) {
                          getIt<TecBloc>()
                              .add(PickSubCategoryEvent(entities: item));
                        },
                      );
                    },
                  );
                } else {
                  ToastUtils.showCenterShortToast("please chose SubService");
                }
              },
            );
          },
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder(
                      bloc: getIt<TecBloc>(),
                      builder: (context, state) {
                        if (getIt<TecBloc>().selectedCategory != null) {
                          return Text(
                            "${getIt<TecBloc>().selectedCategory?.name.ar}:",
                            style: const TextStyle(
                              color: ColorManager.blackColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          );
                        }
                        return const Offstage();
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BlocBuilder(
                      bloc: getIt<TecBloc>(),
                      buildWhen: (previous, current) {
                        if (current is RemoveSubCategoryLoaded ||
                            current is PickSubCategoryLoaded) {
                          return true;
                        } else if (current is GetSubCategoryComplete) {
                          return true;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        if (getIt<TecBloc>().selectedSubCategory.isNotEmpty) {
                          return Flexible(
                            child: Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: getIt<TecBloc>()
                                  .selectedSubCategory
                                  .map((item) {
                                return
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: ColorManager.primaryColor,
                                        ),
                                        padding: const EdgeInsets.all(6),
                                        child: Text(item.name?.ar ?? "",style: FontManager.itemFonts,),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Transform.translate(
                                          offset: const Offset(-6, -6), // Adjust the offset as needed
                                          child: GestureDetector(
                                            onTap: () {
                                              getIt<TecBloc>().add(
                                                RemoveSubCategoryEvent(id: item.id ?? -1),
                                              );
                                            },
                                            child: Container(
                                              width:20,
                                              height:20,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100),
                                                color: ColorManager.primaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white.withOpacity(0.5), // Shadow color
                                                    spreadRadius: 2, // Spread radius
                                                    blurRadius: 25, // Blur radius
                                                    offset: const Offset(0, 3), // Offset in the direction of shadow
                                                  ),
                                                ],
                                              ),
                                              child:  Image.asset(Assets.cancelImage),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                              }).toList(),
                            ),
                          );
                        }
                        return const Offstage();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
