import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../utils/size.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.icon,
    required this.controller
  });
  final String labelText;
  final IconData icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.getSize(context).width * 0.75,
      height: ScreenSize.getSize(context).height * 0.060,
      decoration: BoxDecoration(
          color: AppColors.authTextFieldBackgroundColor,
          border: Border.all(
              width: 1, color: AppColors.authTextFieldStrokeColor),
          borderRadius: BorderRadius.circular(18)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            labelText: labelText,
            labelStyle: TextStyle(color: AppColors.authTextFieldLabelColor),
            border: InputBorder.none),
      ),
    );
  }
}