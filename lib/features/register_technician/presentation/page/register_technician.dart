import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/app_manager/data_validation_manager/data_validation_manager.dart';
import 'package:golden_soft_test/core/app_manager/font_manager/font_manager.dart';
import 'package:golden_soft_test/core/app_manager/service_locator/injection.dart';
import 'package:golden_soft_test/core/constant/assets.dart';
import 'package:golden_soft_test/core/extention/context_extension.dart';
import 'package:golden_soft_test/core/global/app_button.dart';
import 'package:golden_soft_test/core/global/app_input_field.dart';
import 'package:golden_soft_test/core/global/background_widget.dart';
import 'package:golden_soft_test/core/global/image_avatar.dart';
import 'package:golden_soft_test/core/params/reigster_tec_params.dart';
import 'package:golden_soft_test/core/utils/toast_utils.dart';
import 'package:golden_soft_test/features/register_technician/presentation/bloc/tec_bloc.dart';
import 'package:golden_soft_test/features/register_technician/presentation/params/registerParams.dart';
import 'package:golden_soft_test/features/register_technician/presentation/widget/drop_down_widget.dart';
import 'package:golden_soft_test/features/register_technician/presentation/widget/drop_dwon_with_pop_up.dart';
import 'package:golden_soft_test/features/register_technician/presentation/widget/map_container.dart';
import 'package:golden_soft_test/features/register_technician/presentation/widget/sub_service_widget.dart';
import 'package:image_picker/image_picker.dart';

class RegisterTechnician extends StatefulWidget {
  const RegisterTechnician({Key? key}) : super(key: key);

  @override
  State<RegisterTechnician> createState() => _RegisterTechnicianState();
}

class _RegisterTechnicianState extends State<RegisterTechnician> {
  RegisterInterfaceParams registerInterfaceParams = RegisterInterfaceParams();
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    getIt<TecBloc>().add(CategoryTecEvent());
    super.initState();
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Stack(
        children: [
          const BackgroundWidget(),
          Center(
            child: Container(
              width: context.width(0.9),
              height: context.height(0.95),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorManager.primaryContainer),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: context.height(0.03),
                            bottom: context.height(0.01)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Text("تسجيل جديد",
                                  style: FontManager.titleText),
                            ),
                            Text(
                              "تسجيل الدخول",
                              style: FontManager.titleTextPrimary,
                            )
                          ],
                        ),
                      ),
                      ImageAvatar(
                        pickFile: (avatarPhoto) => getIt<TecBloc>().avatarPhoto,
                      ),
                      AppInputField(
                        controller: registerInterfaceParams.nameController,
                        hintText: "الاسم",
                        labelText: "",
                        isRequired: false,
                        validator: (value) {
                          return DataValidationManager.globalValidation(
                              value, context, "name");
                        },
                        prefix: Image.asset(Assets.nameImage),
                      ),
                      AppInputField(
                        controller: registerInterfaceParams.phoneController,
                        hintText: "رقم الجوال",
                        labelText: "",
                        validator: (value) {
                          return DataValidationManager
                              .globalMobileNumberValidation(
                                  value, context, "Mobile Number");
                        },
                        isRequired: false,
                        prefix: Image.asset(Assets.mobileNumberImage),
                      ),
                      AppInputField(
                        controller: registerInterfaceParams.emailController,
                        hintText: "الايميل",
                        labelText: "",
                        validator: (value) {
                          return DataValidationManager.emailValidation(
                              value, context);
                        },
                        isRequired: false,
                        prefix: Image.asset(Assets.emailImage),
                      ),
                      SizedBox(
                        height: 70,
                        child: AppInputField(
                          controller:
                              registerInterfaceParams.passwordController,
                          hintText: "كلمة المرور",
                          labelText: "",
                          isRequired: false,
                          validator: (value) {
                            return DataValidationManager.passwordValidation(
                                value, context);
                          },
                          prefix: Image.asset(Assets.passwordImage),
                        ),
                      ),
                      AppInputField(
                        controller: registerInterfaceParams.countryController,
                        hintText: "المدينة",
                        labelText: "",
                        isRequired: false,
                        validator: (value) {
                          return DataValidationManager.globalValidation(
                              value, context, "Country");
                        },
                        prefix: Image.asset(Assets.countryImage),
                      ),
                      const DropDownWidget(),
                      DropDownWithPopUp(),
                      AppInputField(
                        controller: registerInterfaceParams.bankNameController,
                        hintText: "اسم البنك",
                        labelText: "",
                        isRequired: false,
                        prefix: Image.asset(Assets.bankNameImage),
                      ),
                      AppInputField(
                        controller: registerInterfaceParams.iBanController,
                        hintText: "رقم البيان",
                        labelText: "",
                        isRequired: false,
                        prefix: Image.asset(Assets.iBanImage),
                      ),
                      MapContainer(
                        selectLocation: (latitude, longitude) {
                          getIt<TecBloc>().selectedLatitude = latitude;
                          getIt<TecBloc>().selectedLongitude = longitude;
                        },
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Image.asset(Assets.selectImage),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("صورة الاقامة",
                                  style: FontManager.defaultTextField),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            height: context.height(0.1),
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorManager.greyColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: _imageFile == null
                                  ? Image.asset(Assets.uploadImage)
                                  : Image.file(_imageFile!),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: BlocBuilder(
                          bloc: getIt<TecBloc>(),
                          builder: (context, state) {
                            if (state is RegisterLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primaryColor,
                                ),
                              );
                            }
                            return AppButton(
                              text: "تسجيل الدخول",
                              borderRadius: 50,
                              heightFactor: 0.06,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  getIt<TecBloc>().add(RegisterTecEvent(RegisterTecParams(
                                      email: registerInterfaceParams
                                          .emailController.text,
                                      name: registerInterfaceParams
                                          .nameController.text,
                                      password: registerInterfaceParams
                                          .passwordController.text,
                                      phone: registerInterfaceParams
                                          .phoneController.text,
                                      iban: registerInterfaceParams
                                          .iBanController.text,
                                      latitude: getIt<TecBloc>()
                                          .selectedLatitude
                                          .toString(),
                                      longitude: getIt<TecBloc>()
                                          .selectedLongitude
                                          .toString(),
                                      residencyPhoto: _imageFile,
                                      bankName: registerInterfaceParams
                                          .bankNameController.text,
                                      code: "",
                                      subCategories: "",
                                      photo: getIt<TecBloc>().avatarPhoto)));
                                }
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
