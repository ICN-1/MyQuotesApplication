import 'package:flutter/material.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';
import 'package:my_quotes_application/utils/constants/sizes.dart';

class WideButton extends StatelessWidget {
  const WideButton({
    super.key, 
    required this.onPressed, 
    required this.text, 
    required this.textColor, 
    required this.backgroundColor, 
    required this.iconName, 
    required this.isGoogle
  });

  final String text;
  final bool isGoogle;
  final AssetImage iconName;
  final Color textColor, backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: AppColors.blue,
            width: 3.0
          )
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: iconName,
                color: isGoogle ? null : AppColors.white,
                width: 30.0,
                height: 30.0,
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  text,
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