import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_quotes_application/controllers/profile_page_controller.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/images.dart';
import 'package:my_quotes_application/utils/validators/validators.dart';
import 'package:my_quotes_application/widgets/circular_image.dart';
import 'package:my_quotes_application/widgets/small_button.dart';
import 'package:my_quotes_application/widgets/text_rows.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();

    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailAddressController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    FocusNode focusNode = FocusNode();

    ProfilePageController profilePageController = Get.put(ProfilePageController());
    firstNameController.text = profilePageController.firstName;
    lastNameController.text = profilePageController.lastName;
    usernameController.text = profilePageController.username;
    emailAddressController.text = profilePageController.emailAddress;
    phoneNumberController.text = profilePageController.phoneNumber;
    passwordController.text = "";
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () => profilePageController.pickImage(),
                    child: Obx(() => CircularImage(
                      image: profilePageController.imageUrl.isNotEmpty
                        ? NetworkImage(profilePageController.imageUrl)
                        : const AssetImage(AppImages.profileImage) as ImageProvider,
                    )),
                  ),
                ),
              ),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextRows(
                      leadingText: "First Name:", 
                      controller: firstNameController,
                      validator: (String? text) => AppValidator.validateName(text)
                    ),

                    TextRows(
                      leadingText: "Last Name:", 
                      controller: lastNameController,
                      validator: (String? text) => AppValidator.validateName(text)
                    ),

                    TextRows(
                      leadingText: "Username:", 
                      controller: usernameController,
                      validator: (String? text) => AppValidator.validateName(text)
                    ),

                    TextRows(
                      leadingText: "Email Address:", 
                      controller: emailAddressController,
                      validator: (String? text) => AppValidator.validateEmail(text)
                    ),

                    TextRows(
                      leadingText: "Phone Number:", 
                      controller: phoneNumberController,
                      validator: (String? text) => AppValidator.validatePhone(text)
                    ),

                    TextRows(
                      leadingText: "Password:", 
                      controller: passwordController,
                      validator: (String? text) => AppValidator.validatePassword(text)
                    )
                  ]
                )
              ),

              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallButton(
                      buttonText: "Edit Profile", 
                      textColor: AppColors.white, 
                      backgroundColor: AppColors.blue, 
                      icon: Icons.create_rounded
                    ),
                
                    SmallButton(
                      buttonText: "Logout", 
                      textColor: AppColors.white, 
                      backgroundColor: AppColors.blue, 
                      icon: Icons.logout_rounded
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}