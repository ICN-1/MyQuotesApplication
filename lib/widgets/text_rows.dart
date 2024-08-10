import 'package:flutter/material.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/sizes.dart';

class TextRows extends StatelessWidget {
  const TextRows({
    super.key, 
    required this.leadingText, 
    required this.respondingText, 
  });

  final String leadingText, respondingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      leadingText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.textSmall,
                      ),
                    ),
                  ),
                ),
            
                Flexible(
                  child: Text(
                    respondingText,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: AppSizes.textBig,
                    ),
                  ),
                ),
              ],
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 7.0),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: AppColors.grey,
            ),
          )
        ],
      ),
    );
  }
}