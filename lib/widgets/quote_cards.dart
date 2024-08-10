import 'package:flutter/material.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/sizes.dart';

class QuoteCards extends StatelessWidget {
  const QuoteCards({
    super.key, 
    required this.author, 
    required this.text
  });

  final String author, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          " - $author",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
            fontSize: AppSizes.textBig
          ),
        ),
      
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              fontSize: AppSizes.textBig
            ),
          ),
        ),
      
        Padding(
          padding: const EdgeInsets.only(top: 3.0, bottom: 7.0),
          child: Container(
            height: 1.0,
            width: double.infinity,
            color: AppColors.grey,
          ),
        )
      ],
    );
  }
}