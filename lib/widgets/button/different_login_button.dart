import 'package:flutter/material.dart';
import 'package:shartflix/themes/app_colors.dart';

import '../../utils/size.dart';

class DifferentLoginButton extends StatelessWidget {
  const DifferentLoginButton({
    super.key,
    required this.imagePath,
    required this.onTap
  });
  final String imagePath;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.getSize(context).width*0.15,
      height: ScreenSize.getSize(context).height*0.07,
      decoration: BoxDecoration(
          color: AppColors.differentLoginButtonColor,
          borderRadius: BorderRadius.circular(18)),
      child: Image.asset(imagePath),
    );
  }
}
