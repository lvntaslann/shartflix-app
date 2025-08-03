import 'package:flutter/material.dart';

class AppColors {
  static bool isThemeDarkMode = true;

  static void updateTheme(bool isDark) {
    isThemeDarkMode = isDark;
  }

  static Color get backgroundColor =>
      isThemeDarkMode ? const Color(0xFF090909) : Colors.white;

  static Color get userAgreementColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get authDescTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get authTopTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get authTextFieldStrokeColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.2)
      : Colors.black.withOpacity(0.2);

  static Color get authTextFieldBackgroundColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.1)
      : Colors.black.withOpacity(0.05);

  static Color get authTextFieldLabelColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.5)
      : Colors.black.withOpacity(0.5);

  static Color get authTextFieldTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get authTextFieldHintStyle =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get authButtonColor =>
      isThemeDarkMode ? const Color(0xFFE50914) : Colors.redAccent;

  static Color get authButtonTextColor =>
      Colors.white;

  static Color get differentLoginButtonColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.1)
      : Colors.black.withOpacity(0.1);

  static Color get alreadyAccountTextColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.5)
      : Colors.black.withOpacity(0.5);

  static Color get backButtonBackgroundColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.10)
      : Colors.black.withOpacity(0.05);

  static Color get backButtonStrokeColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.1)
      : Colors.black.withOpacity(0.1);

  static Color get backButtonIconColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get addPhotoButtonColor =>
      isThemeDarkMode ? const Color(0xFFE50914) : Colors.redAccent;

  static Color get addPhotoButtonTextColor => Colors.white;

  static Color get notFoundFavoriteMovieColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get favoriteMovieTitleColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get favoriteMovieDescriptionColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.6)
      : Colors.black.withOpacity(0.6);

  static Color get bottomNavBackgroundColor =>
      isThemeDarkMode ? Colors.black : Colors.white;

  static Color get bottomNavActiveColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.05)
      : Colors.black.withOpacity(0.05);

  static Color get bottomNavPasiveColor =>
      isThemeDarkMode ? Colors.black : Colors.grey.shade300;

  static Color get bottomNavActiveTextColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.9)
      : Colors.black.withOpacity(0.8);

  static Color get bottomNavPasiveTextColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.5)
      : Colors.black.withOpacity(0.5);

  static Color get bottomNavStrokeColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.2)
      : Colors.black.withOpacity(0.2);

  static Color get bottomNavPasiveItemColor =>
      isThemeDarkMode ? Colors.black : Colors.grey.shade200;

  static Color get bottomNavActiveItemColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.2)
      : Colors.black.withOpacity(0.1);

  static Color get nameTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get idTextColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.5)
      : Colors.black.withOpacity(0.5);

  static Color get photoIconColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.3)
      : Colors.black.withOpacity(0.3);

  static Color get profilPageTopTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get limittedOfferButtonColor =>
      isThemeDarkMode ? const Color(0xFFE50914) : Colors.red;

  static Color get limittedOfferButtonTextColor => Colors.white;

  static Color get pullToRefreshForegroundColor =>
      isThemeDarkMode ? Colors.redAccent : Colors.blue;

  static Color get pullToRefreshBackgroundColor =>
      isThemeDarkMode ? Colors.black : Colors.white;

  static Color get circularProgresIndicatorColor =>
      isThemeDarkMode ? Colors.redAccent : Colors.blueAccent;

  static Color get movieLogoColor =>
      isThemeDarkMode ? const Color(0xFFE50914) : Colors.redAccent;

  static Color get movieStrokeColor =>
      isThemeDarkMode ? const Color(0xFFE50914) : Colors.redAccent;

  static Color get movieTitleTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get movieDescTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get moreTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get favoriteButtonBackgroundColor => isThemeDarkMode
      ? Colors.black.withOpacity(0.3)
      : Colors.grey.withOpacity(0.2);

  static Color get favoriteButtonStrokeColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.3)
      : Colors.black.withOpacity(0.3);

  static Color get favoriteButtonActiveIconColor =>
      isThemeDarkMode ? Colors.redAccent : Colors.red;

  static Color get favoriteButtonPasiveIconColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get errorTextColor =>
      isThemeDarkMode ? Colors.white : Colors.red;

  static Color get addPhotoTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get addPhotoDescTextColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get addPhotoButtonBackgroundColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.1)
      : Colors.black.withOpacity(0.1);

  static Color get addPhotoStrokeColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.1)
      : Colors.black.withOpacity(0.1);

  static Color get addPhotoIconColor => isThemeDarkMode
      ? Colors.white.withOpacity(0.5)
      : Colors.black.withOpacity(0.5);

   static Color get cardBackgroundColor => const Color.fromARGB(255, 13, 13, 13);

  static Color get mainOfferTitleColor => Colors.white;

  static Color get secondTitleColor =>
      isThemeDarkMode ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8);

  static Color get seeAllTokensButtonColor =>
      isThemeDarkMode ? const Color(0xFFE50914).withOpacity(0.6) : Colors.red.withOpacity(0.6);

  static Color get seeAllTokensButtonTextColor => Colors.white;

  static Color get seeAllTokensButtonShadowColor =>
      isThemeDarkMode ? const Color(0xFFE50914).withOpacity(0.4) : Colors.red.withOpacity(0.4);

  static Color get shadowColor =>
      isThemeDarkMode ? const Color(0xFFE50914).withOpacity(0.4) : Colors.red.withOpacity(0.4);

  static Color get bonusContainerColor =>
      isThemeDarkMode ? Colors.white.withOpacity(0.07) : Colors.black.withOpacity(0.07);

  static Color get bonusContaninerTitleColor =>
      isThemeDarkMode ? Colors.white : Colors.black;

  static Color get bonusContainerGradiendFirstColor => const Color(0xFFE50914);

  static Color get bonusContainerGradiendSecondColor => const Color(0xFF6F060B);

  static Color get bonusContainerFirstShadowColor => const Color(0xFF6F060B);

  static Color get bonusContainerSuperFirstGradiendColor => const Color(0xFFE50914);

  static Color get bonusContainerSuperSecondGradiendColor => const Color(0xFF5949E6);

  static Color get bonusContainerSuperShadowColor => const Color(0xFF5949E6);

                  
                      
}
