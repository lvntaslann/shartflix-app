import 'package:flutter/material.dart';
import 'package:shartflix/themes/app_colors.dart';

import '../../utils/size.dart';

class LimittedOfferButton extends StatelessWidget {
  const LimittedOfferButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 111,
      height: 33,
      decoration: BoxDecoration(
          color: AppColors.limittedOfferButtonColor,
          borderRadius: BorderRadius.circular(53)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/diamond.png"),
          SizedBox(width: ScreenSize.getSize(context).width * 0.02),
          Text(
            "Sınırlı Teklif",
            style: TextStyle(
                color: AppColors.limittedOfferButtonTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}