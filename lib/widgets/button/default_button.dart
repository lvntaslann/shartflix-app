import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../utils/size.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ScreenSize.getSize(context).width * 0.75,
        height: ScreenSize.getSize(context).height * 0.060,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.authButtonColor),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: AppColors.authButtonTextColor, fontSize: 15),
        )),
      ),
    );
  }
}