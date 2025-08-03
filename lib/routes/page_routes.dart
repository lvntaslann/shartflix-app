import 'package:flutter/material.dart';
import 'package:shartflix/pages/add_photo/add_photo_page.dart';

import '../pages/mainpage_controller.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/signup_page.dart';

class PageRoutes {
  static void goToLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
  }

  static void goToSignup(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => SignupPage()));
  }

  static void goToAddPhoto(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddPhotoPage()));
  }

  static void goToHome(BuildContext context, {bool replace = false}) {
    if (replace) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainPageController()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) =>const MainPageController()));
    }
  }

  static void goAddPhoto(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddPhotoPage()));
  }
}
