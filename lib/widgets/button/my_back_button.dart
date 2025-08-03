import 'package:flutter/material.dart';
import 'package:shartflix/themes/app_colors.dart';
import '../../utils/size.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: ScreenSize.getSize(context).width*0.10,
        height: ScreenSize.getSize(context).height*0.10,
        decoration: BoxDecoration(
          color: AppColors.backButtonBackgroundColor,
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: AppColors.backButtonStrokeColor
          )
        ),
        child: Icon(Icons.arrow_back,color: AppColors.backButtonIconColor,),
      ),
    );
  }
}