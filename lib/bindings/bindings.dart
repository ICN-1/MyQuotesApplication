import 'package:get/get.dart';
import 'package:my_quotes_application/controllers/login_and_sign_up_page_controller.dart';
import 'package:my_quotes_application/controllers/main_menu_controller.dart';
import 'package:my_quotes_application/controllers/profile_page_controller.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginAndSignupPageController());
    Get.lazyPut(() => MainMenuController());
    Get.lazyPut(() => ProfilePageController());
  }
}