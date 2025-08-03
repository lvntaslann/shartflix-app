import 'package:flutter/material.dart';
import 'package:shartflix/themes/app_colors.dart';
import 'package:shartflix/utils/size.dart';

class LimitedOfferBottomSheet extends StatelessWidget {
  const LimitedOfferBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackgroundColor,
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),

              // Başlık ve açıklama
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      spreadRadius: 10,
                      blurRadius: 250,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sınırlı Teklif",
                      style: TextStyle(
                        color: AppColors.mainOfferTitleColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Jeton paketinizi seçerek bonus\nkazanın ve yeni bölümlerin kilidini açın!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.secondTitleColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Bonus Items Row
              Container(
                width: ScreenSize.getSize(context).width * 0.9,
                height: ScreenSize.getSize(context).height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  gradient: RadialGradient(
                    colors: [
                      AppColors.bonusContainerColor,
                      AppColors.bonusContainerColor
                    ],
                    center: Alignment.bottomRight,
                    radius: 2.5,
                    focal: Alignment.center,
                    tileMode: TileMode.clamp,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      SizedBox(
                          height: ScreenSize.getSize(context).height * 0.02),
                      Text(
                        "Alacağınız bonuslar",
                        style: TextStyle(
                            color: AppColors.bonusContaninerTitleColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                          height: ScreenSize.getSize(context).height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildBonusItem(
                              "assets/icons/premium_account_icon.png",
                              'Premium\nHesap'),
                          const SizedBox(width: 20),
                          _buildBonusItem("assets/icons/more_match_icon.png",
                              'Daha\nFazla Eşleşme'),
                          const SizedBox(width: 20),
                          _buildBonusItem(
                              "assets/icons/featured_icon.png", 'Öne\nÇıkarma'),
                          const SizedBox(width: 20),
                          _buildBonusItem("assets/icons/more_likes.png",
                              'Daha\nFazla Beğeni'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Select Token Package Title
              Text(
                "Kilidi açmak için bir jeton paketi seçin",
                style: TextStyle(
                  color: AppColors.bonusContaninerTitleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),

              // Token Packages Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTokenPackage(
                      context,
                      "+10%",
                      "200",
                      "330",
                      "₺99,99",
                      AppColors.bonusContainerGradiendFirstColor,
                      AppColors.bonusContainerGradiendSecondColor,
                      AppColors.bonusContainerFirstShadowColor),
                  _buildTokenPackage(
                      context,
                      "+70%",
                      "2.000",
                      "3.375",
                      "₺799,99",
                      AppColors.bonusContainerSuperFirstGradiendColor,
                      AppColors.bonusContainerSuperSecondGradiendColor,
                      AppColors.bonusContainerSuperShadowColor),
                  _buildTokenPackage(
                      context,
                      "+35%",
                      "1.000",
                      "1.350",
                      "₺399,99",
                      AppColors.bonusContainerGradiendFirstColor,
                      AppColors.bonusContainerGradiendSecondColor,
                      AppColors.bonusContainerFirstShadowColor),
                ],
              ),
              const SizedBox(height: 25),

              // See All Tokens Button
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.seeAllTokensButtonShadowColor,
                      spreadRadius: 2,
                      blurRadius: 100,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.seeAllTokensButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          "Tüm Jetonları Gör",
                          style: TextStyle(
                            color: AppColors.seeAllTokensButtonTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        /* Positioned(
          bottom: -20, // Gölgeyi yukarı taşı
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 217,
              height: 217,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE50914).withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 217,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
            ),
          ),
        ),*/
      ],
    );
  }

  Widget _buildBonusItem(String image, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF6F060B),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Color(0xFF6F060B)),
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 0,
                  blurRadius: 6.5,
                ),
              ],
            ),
            child: Image.asset(image)),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildTokenPackage(
      BuildContext context,
      String percentage,
      String oldTokens,
      String newTokens,
      String price,
      Color gradientColor1,
      Color gradientcolor2,
      Color color3) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: ScreenSize.getSize(context).width * 0.27,
          height: ScreenSize.getSize(context).height * 0.24,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [gradientColor1, gradientcolor2],
              center: Alignment.bottomCenter,
              radius: 2,
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 1,
              style: BorderStyle.solid,
            ),
            boxShadow: [
              BoxShadow(color: gradientColor1),
              BoxShadow(
                color: Colors.white,
                spreadRadius: 0,
                blurRadius: 2.5,
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                oldTokens,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.white,
                ),
              ),
              Text(
                newTokens,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                "Jeton",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                price,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Başına haftalık",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: ScreenSize.getSize(context).width * 0.13,
              height: ScreenSize.getSize(context).height * 0.025,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: color3,
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(width: 1, color: Colors.white.withOpacity(0.4)),
                boxShadow: [
                  BoxShadow(color: gradientColor1),
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 0,
                    blurRadius: 2.5,
                  ),
                ],
              ),
              child: Text(
                percentage,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
