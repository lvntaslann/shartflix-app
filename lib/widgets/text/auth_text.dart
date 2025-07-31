import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.authTopTextColor,
          fontSize: 30,
          fontWeight: FontWeight.w700),
    );
  }
}