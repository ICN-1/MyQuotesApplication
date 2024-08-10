import 'package:dio/dio.dart';
import 'package:get/get.dart';

class QuotesPageController extends GetxController{
  @override
  void onInit() {
    getQuotes();

    super.onInit();
  }

  final RxList _quotes = [].obs;
  List get quotes => _quotes;

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  Future<void> getQuotes() async{
    try {
      var response = await Dio().get("https://dummyjson.com/quotes");
      _quotes.value = response.data["quotes"];
      _isLoading.value = false;
    } catch (e) {
      Get.snackbar("Failure", "Failed to get quotes: $e");
      _isLoading.value = false;
    }
  }
}