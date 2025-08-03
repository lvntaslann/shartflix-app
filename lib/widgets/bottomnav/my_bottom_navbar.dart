import 'package:flutter/material.dart';
import '../../themes/app_colors.dart';
import '../../constants/bottom_nav_items.dart';
import '../../utils/size.dart';

class MyBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MyBottomNavbar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = BottomNavItems.items;
    final screenWidth = ScreenSize.getSize(context).width;

    return Container(
      color: AppColors.bottomNavBackgroundColor,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isActive = currentIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              margin: EdgeInsets.only(right: index != items.length - 1 ? screenWidth * 0.06 : 0),
              width: screenWidth * 0.33,
              height: 40,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.bottomNavActiveColor
                    : AppColors.bottomNavPasiveColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.bottomNavStrokeColor,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item["icon"] as IconData,
                    color: isActive
                        ? AppColors.bottomNavActiveTextColor
                        : AppColors.bottomNavPasiveTextColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    item["label"] as String,
                    style: TextStyle(
                      color: isActive
                          ? AppColors.bottomNavActiveTextColor
                          : AppColors.bottomNavPasiveTextColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
