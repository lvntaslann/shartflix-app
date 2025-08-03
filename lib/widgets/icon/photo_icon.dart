import 'package:flutter/material.dart';
import 'package:shartflix/themes/app_colors.dart';
import '../../utils/size.dart';

class PhotoIcon extends StatelessWidget {
  const PhotoIcon({
    super.key,
    required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    final double size = ScreenSize.getSize(context).width * 0.14;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.photoIconColor,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
