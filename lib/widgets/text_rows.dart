import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/sizes.dart';

class TextRows extends StatelessWidget {
  const TextRows({
    super.key, 
    required this.leadingText, 
    required this.controller, 
    required this.validator, 
  });

  final String leadingText;
  final TextEditingController controller;
  final String? Function(String?) validator;

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
                Text(
                  leadingText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.textNormal,
                  ),
                ),
            
                TextFormField(
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: AppSizes.textBig,
                  ), 
                  
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  validator: (text) => validator(text),
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                )
              ],
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.only(top: 7.0, bottom: 20.0),
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