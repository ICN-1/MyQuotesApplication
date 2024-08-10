import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quotes_application/controllers/main_menu_controller.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/sizes.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainMenuController mainMenuController = Get.put(MainMenuController());

    return Obx(() => Scaffold(
      body: mainMenuController.pages[mainMenuController.tabIndex],
      bottomNavigationBar: IntrinsicHeight(
        child: SizedBox(
          child: BottomNavigationBar(
            backgroundColor: AppColors.blue,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: AppSizes.textBig,
            unselectedFontSize: AppSizes.textSmall,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.white,
            currentIndex: mainMenuController.tabIndex,
            onTap: (index) => mainMenuController.changeTab(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.pages_rounded,
                  color: AppColors.white,
                ),
                label: "Quotes",
              ),
        
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person, 
                  color: AppColors.white,
                ),
                label: "Profile"
              )
            ],
          ),
        ),
      ),
    ));
  }
}