import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quotes_application/controllers/profile_page_controller.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/images.dart';
import 'package:my_quotes_application/widgets/circular_image.dart';
import 'package:my_quotes_application/widgets/small_button.dart';
import 'package:my_quotes_application/widgets/text_rows.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    ProfilePageController profilePageController = Get.put(ProfilePageController());
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
                child: Center(
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
                child: Column(
                  children: [
                    TextRows(
                      leadingText: "First Name:", 
                      respondingText: profilePageController.firstName
                    ),

                    TextRows(
                      leadingText: "Last Name:",
                      respondingText: profilePageController.lastName,
                    ),

                    TextRows(
                      leadingText: "Username:", 
                      respondingText: profilePageController.username,
                    ),

                    TextRows(
                      leadingText: "Email Address:", 
                      respondingText: profilePageController.emailAddress,
                    ),

                    TextRows(
                      leadingText: "Phone Number:", 
                      respondingText: profilePageController.phoneNumber,
                    ),
                  ]
                )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallButton(
                      buttonText: "Edit Profile", 
                      textColor: AppColors.white, 
                      backgroundColor: AppColors.blue, 
                      icon: Icons.create_rounded, 
                      onPressed: () => profilePageController.goToEditProfileDialog(context)
                    ),
                
                    SmallButton(
                      buttonText: "Logout", 
                      textColor: AppColors.white, 
                      backgroundColor: AppColors.blue, 
                      icon: Icons.logout_rounded, 
                      onPressed: () => profilePageController.logOut(),
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