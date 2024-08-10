import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_quotes_application/controllers/quotes_page_controller.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/sizes.dart';
import 'package:my_quotes_application/utils/constants/text.dart';
import 'package:my_quotes_application/widgets/quote_cards.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuotesPageController quotesPageController = Get.put(QuotesPageController());

    return SafeArea(
      child: Obx(() => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppTexts.quotesHeader,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppSizes.headingBig,
              color: AppColors.white
            ),
          ),
          backgroundColor: AppColors.blue,
        ),

        body: quotesPageController.isLoading 
          ? const Center(
            child: CircularProgressIndicator()
          ) : ListView.builder(
            itemCount: quotesPageController.quotes.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: QuoteCards(
                  text: quotesPageController.quotes[index]["quote"],
                  author: quotesPageController.quotes[index]["author"]
                ),
              );
            }
          )
      ))
    );
  }
}