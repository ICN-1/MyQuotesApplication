import 'package:get/get.dart';
import 'package:my_quotes_application/controllers/login_and_sign_up_page_controller.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginAndSignupPageController());
  }
}