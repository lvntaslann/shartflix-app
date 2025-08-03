import 'package:flutter/material.dart';
import 'package:shartflix/themes/app_colors.dart';

class NameAndId extends StatelessWidget {
  const NameAndId({super.key, required this.name, required this.id});
  final String name;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(color: AppColors.nameTextColor, fontSize: 15),
        ),
        Text(
          id,
          style: TextStyle(color: AppColors.idTextColor, fontSize: 12),
        )
      ],
    );
  }
}
