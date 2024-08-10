import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  final RxList _filteredQuotes = [].obs;
  List get filteredQuotes => _filteredQuotes;

  final RxBool _isSearchVisible = false.obs; // To manage search visibility
  bool get isSearchVisible => _isSearchVisible.value;

  final FocusNode searchFocusNode = FocusNode();

  void toggleSearchVisibility() {
    _isSearchVisible.value = !_isSearchVisible.value;
    if (_isSearchVisible.value) {
      searchFocusNode.requestFocus();
    } else {
      searchFocusNode.unfocus();
    }
  }

  Future<void> getQuotes() async{
    try {
      var response = await Dio().get("https://dummyjson.com/quotes");
      _quotes.value = response.data["quotes"];
      _filteredQuotes.value = _quotes;
      _isLoading.value = false;
    } catch (e) {
      Get.snackbar("Failure", "Failed to get quotes: $e");
      _isLoading.value = false;
    }
  }

  void filterQuotes(String query) {
    if (query.isEmpty) {
      _filteredQuotes.value = _quotes;
    } else {
      _filteredQuotes.value = _quotes
          .where((quote) =>
              quote["author"].toLowerCase().contains(query.toLowerCase()) ||
              quote["quote"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}