import 'package:flutter/material.dart';
import 'package:shartflix/pages/add_photo_page.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/signup_page.dart';

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
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    }
  }
}
