import 'package:get/get.dart';
import 'package:my_quotes_application/screens/profile_page.dart';
import 'package:my_quotes_application/screens/quotes_page.dart';

class MainMenuController extends GetxController {
  final RxInt _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;

  final _pages = [
    const QuotesPage(),
    const ProfilePage()
  ];
  List get pages => _pages;

  void changeTab(int index){
    _tabIndex.value = index;
  }
}