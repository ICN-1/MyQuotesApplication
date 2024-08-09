import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quotes_application/bindings/bindings.dart';
import 'package:my_quotes_application/routes/routes.dart';
import 'package:my_quotes_application/screens/login_page.dart';
import 'package:my_quotes_application/screens/main_menu_page.dart';
import 'package:my_quotes_application/screens/profile_page.dart';
import 'package:my_quotes_application/screens/quotes_page.dart';
import 'package:my_quotes_application/screens/sign_up_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Quotes Application',
      initialBinding: AppBindings(),
      home: const MainMenuPage(),
      getPages: [
        GetPage(name: AppRoutes.loginPageRoute, page: ()=> const LoginPage()),
        GetPage(name: AppRoutes.signUpPageRoute, page: ()=> const SignUpPage()),
        GetPage(name: AppRoutes.quotesPageRoute, page: ()=> const QuotesPage()),
        GetPage(name: AppRoutes.profilePageRoute, page: ()=> const ProfilePage()),
        GetPage(name: AppRoutes.mainMenuPageRoute, page: ()=> const MainMenuPage()),
        GetPage(name: AppRoutes.homePageRoute, page: ()=> const HomePage())
      ],
    );
  }
}