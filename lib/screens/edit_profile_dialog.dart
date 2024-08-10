import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quotes_application/controllers/profile_page_controller.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/images.dart';
import 'package:my_quotes_application/utils/validators/validators.dart';
import 'package:my_quotes_application/widgets/circular_image.dart';
import 'package:my_quotes_application/widgets/text_form_field.dart';
import 'package:my_quotes_application/widgets/wide_button.dart';

class EditProfileDialog extends StatelessWidget {
  const EditProfileDialog({
    super.key, 
    required this.firstName, 
    required this.lastName, 
    required this.username, 
    required this.emailAddress, 
    required this.phoneNumber
  });

  final String firstName, lastName, username, emailAddress, phoneNumber;

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailAddressController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    firstNameController.text = firstName;
    lastNameController.text = lastName;
    usernameController.text = username;
    emailAddressController.text = emailAddress;
    phoneNumberController.text = phoneNumber;

    GlobalKey<FormState> formKey = GlobalKey();
    ProfilePageController profilePageController = Get.put(ProfilePageController());

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: GestureDetector(
                onTap: profilePageController.pickImage,
                child: Obx(() => CircularImage(
                  image: profilePageController.imageUrl.isNotEmpty
                    ? (profilePageController.imageUrl.startsWith('http')
                        ? NetworkImage(profilePageController.imageUrl)
                        : FileImage(File(profilePageController.imageUrl))) as ImageProvider
                    : const AssetImage(AppImages.profileImage),
                )),
              ),
            ),

            Form(
              key: formKey,
              child: GetBuilder<ProfilePageController> (
                init: Get.find<ProfilePageController>(),
                builder: (textForm) => Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
                        child: AppTextFormField(
                          label: "First Name", 
                          hint: "Please enter your first name.", 
                          prefixIcon: const Icon(
                            Icons.person_rounded
                          ), 
                          isPassword: false, 
                          controller: firstNameController, 
                          inputType: TextInputType.name, 
                          validationType: AppValidator.validateName
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
                        child: AppTextFormField(
                          label: "Last Name", 
                          hint: "Please enter your last name.", 
                          prefixIcon: const Icon(
                            Icons.person_rounded
                          ), 
                          isPassword: false, 
                          controller: lastNameController, 
                          inputType: TextInputType.name, 
                          validationType: AppValidator.validateName
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
                        child: AppTextFormField(
                          label: "Username", 
                          hint: "Please enter your user name.", 
                          prefixIcon: const Icon(
                            Icons.person_rounded
                          ), 
                          isPassword: false, 
                          controller: usernameController, 
                          inputType: TextInputType.name, 
                          validationType: AppValidator.validateName
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
                        child: AppTextFormField(
                          label: "Email Address", 
                          hint: "Please enter your email address.", 
                          prefixIcon: const Icon(
                            Icons.email_rounded
                          ), 
                          isPassword: false, 
                          controller: emailAddressController, 
                          inputType: TextInputType.emailAddress, 
                          validationType: AppValidator.validateEmail
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
                        child: AppTextFormField(
                          label: "Phone Number", 
                          hint: "Please enter your phone number.", 
                          prefixIcon: const Icon(
                            Icons.phone_callback_rounded
                          ), 
                          isPassword: false, 
                          controller: phoneNumberController, 
                          inputType: TextInputType.emailAddress, 
                          validationType: AppValidator.validatePhone
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
                        child: AppTextFormField(
                          label: "Password", 
                          hint: "Please enter your password.", 
                          prefixIcon: const Icon(
                            Icons.password_rounded
                          ), 
                          isPassword: true, 
                          controller: passwordController, 
                          inputType: TextInputType.text, 
                          validationType: AppValidator.validatePassword2,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
                        child: WideButton(
                          onPressed: () => profilePageController.saveUserDetails(
                            formKey, 
                            firstNameController.text,
                            lastNameController.text,
                            usernameController.text,
                            emailAddressController.text,
                            phoneNumberController.text, 
                            passwordController.text
                          ), 
                          text: "Edit Profile", 
                          textColor: AppColors.white, 
                          backgroundColor: AppColors.blue, 
                          iconName: const AssetImage(
                            AppImages.profileImage
                          ),
                          isGoogle: false,
                        ),
                      ),
                  ]
                )
              )
            )
          ],
        ),
      ),
    );
  }
}