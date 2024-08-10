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

    return GestureDetector(
      onTap: (){
        if (quotesPageController.isSearchVisible) {
          quotesPageController.toggleSearchVisibility();
        }
      },
      child: SafeArea(
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
      
          body: Column(
            children: [
              if (quotesPageController.isSearchVisible) 
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: TextField(
                    focusNode: quotesPageController.searchFocusNode,
                    onChanged: (value) {
                      quotesPageController.filterQuotes(value);
                    },
                    decoration: const InputDecoration(
                      hintText: "Search Quotes...",
                      hintStyle: TextStyle(
                        color: AppColors.black
                      ),
                    ),
                    style: const TextStyle(
                      color: AppColors.black
                    ),
                  )
                ),
      
              quotesPageController.isLoading 
                ? const Center(
                  child: CircularProgressIndicator()
                ) : Expanded(
                  child: ListView.builder(
                    itemCount: quotesPageController.filteredQuotes.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                        child: QuoteCards(
                          text: quotesPageController.filteredQuotes[index]["quote"],
                          author: quotesPageController.filteredQuotes[index]["author"]
                        ),
                      );
                    }
                  ),
                ),
            ],
          ),
      
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.blue,
            onPressed: () {
              quotesPageController.toggleSearchVisibility();
            },
            child: const Icon(
              Icons.search_rounded,
              color: AppColors.white,
            ),
          ),
        ))
      ),
    );
  }
}