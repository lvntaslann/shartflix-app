import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shartflix/routes/page_routes.dart';

import '../themes/app_colors.dart';
import '../utils/size.dart';
import '../widgets/button/default_button.dart';
import '../widgets/button/different_login_button.dart';
import '../widgets/text/auth_text.dart';
import '../widgets/textfield/custom_textfield.dart';

class SignupPage extends StatelessWidget {
 SignupPage({ Key? key }) : super(key: key);
    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
  final TextEditingController retryPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: ScreenSize.getSize(context).height * 0.10),
            const TextWidget(
              text: "Hoşgeldiniz",
            ),
            const Text(
              "Tempus varius a vitae interdum id\ntortor elementum tristique eleifend at.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: ScreenSize.getSize(context).height * 0.03,
            ),
                        CustomTextField(
                labelText: "Ad Soyad",
                icon: Icons.person_add,
                controller: nameController),
            SizedBox(height: ScreenSize.getSize(context).height * 0.02),
            CustomTextField(
                labelText: "E-mail",
                icon: Icons.email,
                controller: emailController),
            SizedBox(height: ScreenSize.getSize(context).height * 0.02),
            CustomTextField(
                labelText: "Şifre",
                icon: Icons.lock,
                controller: passwordController),
            SizedBox(height: ScreenSize.getSize(context).height * 0.02),
                        CustomTextField(
                labelText: "Şifre Tekrar",
                icon: Icons.lock,
                controller: retryPasswordController),
            SizedBox(height: ScreenSize.getSize(context).height * 0.02),
            const Text(
              "Kullanıcı sözleşmesini okudum ve kabul ediyorum. Bu\n sözleşmeyi okuyarak devam ediniz lütfen.",
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: ScreenSize.getSize(context).height * 0.03),
            DefaultButton(text: "Şimdi Kaydol",onTap: ()=> PageRoutes.goToAddPhoto(context)),
            SizedBox(height: ScreenSize.getSize(context).height * 0.03),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DifferentLoginButton(imagePath: "assets/google-icon.png",onTap: () {},),
                    SizedBox(width: ScreenSize.getSize(context).width * 0.03),
                    DifferentLoginButton(imagePath: "assets/apple-icon.png",onTap: () {},),
                    SizedBox(width: ScreenSize.getSize(context).width * 0.03),
                    DifferentLoginButton(imagePath: "assets/facebook-icon.png",onTap: () {},),

                  ],
                ),
                SizedBox(height: ScreenSize.getSize(context).height * 0.03),
                GestureDetector(
                  onTap: ()=> PageRoutes.goToLogin(context),
                  child: Text(
                    "Zaten hesabın var mı? Giriş Yap!",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
