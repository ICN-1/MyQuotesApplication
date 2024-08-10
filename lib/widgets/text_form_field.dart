import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quotes_application/controllers/login_and_sign_up_page_controller.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/sizes.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key, 
    required this.label, 
    required this.hint, 
    required this.prefixIcon, 
    required this.isPassword,
    this.onPressedPrefix, 
    this.onPressedSuffix, 
    required this.controller, 
    required this.inputType, 
    required this.validationType
  });

  final String label, hint;
  final Icon prefixIcon;
  final bool isPassword;
  final void Function()? onPressedPrefix, onPressedSuffix;
  final TextEditingController controller;
  final TextInputType inputType;
  final String? Function(String?) validationType;

  @override
  Widget build(BuildContext context) {
    LoginAndSignupPageController textFormFieldController = Get.find<LoginAndSignupPageController>();

    return SizedBox(
      width: double.infinity,
      child: Obx(() => TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword ? textFormFieldController.isTextHidden : textFormFieldController.isFalse,
        validator: (String? text) => validationType(text),

        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          label: Text(label),
          labelStyle: const TextStyle(
            fontSize: AppSizes.textNormal,
            fontWeight: FontWeight.bold,
            color: AppColors.blue
          ),

          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: AppSizes.textNormal,
            fontWeight: FontWeight.w300,
            color: AppColors.blue
          ),

          prefixIcon: IconButton(
            icon: prefixIcon,
            color: AppColors.blue, 
            onPressed: () {},
          ),

          suffixIcon: isPassword ? IconButton(
            icon: Icon(
              textFormFieldController.isTextHidden ? Icons.visibility_rounded : Icons.visibility_off_rounded
            ),
            color: AppColors.blue,
            onPressed: () => textFormFieldController.setHiddentextState(isPassword),
          ):null,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: AppColors.blue
            )
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: AppColors.grey
            )
          )
        ),
      )),
    );
  }
}