import 'package:flutter/material.dart';
import 'package:my_quotes_application/utils/constants/colors.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key, 
    required this.image
  });

  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.yellow,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: image
        )
      ),
    );
  }
}