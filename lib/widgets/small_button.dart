import 'package:flutter/material.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/sizes.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key, 
    required this.buttonText, 
    required this.textColor, 
    required this.backgroundColor, 
    required this.icon
  });

  final String buttonText;
  final Color textColor, backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: AppColors.blue,
            width: 3.0
          )
        ),

        width: 150,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: AppSizes.textNormal,
                    fontWeight: FontWeight.bold,
                    color: textColor
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}