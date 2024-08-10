import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quotes_application/controllers/login_and_sign_up_page_controller.dart';
import 'package:my_quotes_application/routes/routes.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/images.dart';
import 'package:my_quotes_application/utils/constants/sizes.dart';
import 'package:my_quotes_application/utils/constants/text.dart';
import 'package:my_quotes_application/utils/validators/validators.dart';
import 'package:my_quotes_application/widgets/text_form_field.dart';
import 'package:my_quotes_application/widgets/wide_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    LoginAndSignupPageController loginAndSignupPageController = Get.put(LoginAndSignupPageController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        AppImages.quoteIcon,
                      ),
                      width: 50.0,
                      height: 50.0,
                    ),
                
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        AppTexts.appName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.headingNormal
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              Form(
                key: formKey,
                child: GetBuilder<LoginAndSignupPageController> (
                  init: Get.find<LoginAndSignupPageController>(),
                  builder: (textForm) => Column(
                    children: [
                     Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
                        child: AppTextFormField(
                          label: "Email Address", 
                          hint: "Please enter your email address.", 
                          prefixIcon: const Icon(
                            Icons.email_rounded
                          ), 
                          isPassword: false, 
                          controller: emailController, 
                          inputType: TextInputType.emailAddress, 
                          validationType: AppValidator.validateEmail
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
                          validationType: AppValidator.validatePassword
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20),
                        child: WideButton(
                          onPressed: () => loginAndSignupPageController.loginAccount(
                            formKey,
                            emailController.text,
                            passwordController.text
                          ), 
                          text: "Login to Account", 
                          textColor: AppColors.white, 
                          backgroundColor: AppColors.blue, 
                          iconName: const AssetImage(
                            AppImages.createUserIcon
                          ),
                          isGoogle: false,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20, bottom: 20.0),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.signUpPageRoute),
                          child: RichText(
                            text: const TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: AppSizes.textNormal,
                                color: AppColors.black
                              ),
                              children: [
                                TextSpan(
                                  text: " Sign up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppSizes.textNormal,
                                    color: AppColors.blue
                                  ),
                                )
                              ]
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                )
              )
            ],
          ),
        )
      ),
    );
  }
}