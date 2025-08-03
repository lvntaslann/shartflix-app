import 'package:flutter/material.dart';
import 'package:shartflix/themes/app_colors.dart';

class MovieTitle extends StatelessWidget {
  final String title;

  const MovieTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:  TextStyle(
        color: AppColors.movieTitleTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}