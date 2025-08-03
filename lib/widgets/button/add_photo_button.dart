import 'package:flutter/material.dart';
import 'package:shartflix/themes/app_colors.dart';
import '../../utils/size.dart';

class AddPhotoButton extends StatelessWidget {
  const AddPhotoButton({
    required this.onTap,
    super.key,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: ScreenSize.getSize(context).width * 0.29,
        height: ScreenSize.getSize(context).height * 0.038,
        decoration: BoxDecoration(
            color: AppColors.addPhotoButtonColor,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "Fotoğraf Ekle",
            style: TextStyle(
                color: AppColors.addPhotoButtonTextColor,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}