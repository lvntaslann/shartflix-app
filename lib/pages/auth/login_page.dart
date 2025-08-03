import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/utils/size.dart';
import '../../routes/page_routes.dart';
import '../../themes/app_colors.dart';
import '../../widgets/button/default_button.dart';
import '../../widgets/button/different_login_button.dart';
import '../../widgets/text/auth_text.dart';
import '../../widgets/textfield/custom_textfield.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../cubit/auth/auth_state.dart';
import '../../services/auth_services.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(AuthServices()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.error != null) {
              debugPrint(state.error);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!)),
              );
            }
            if (state.user != null) {
              PageRoutes.goToHome(context);
            }
          },
          builder: (context, state) {
            final cubit = context.read<AuthCubit>();

            return Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/app-images/SinFlixLogo.png",
                    width: 300,
                    height: 300,
                  ),
                  const TextWidget(
                    text: "Merhabalar",
                  ),
                  Text(
                    "Tempus varius a vitae interdum id\ntortor elementum tristique eleifend at.",
                    style: TextStyle(
                        color: AppColors.authDescTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: ScreenSize.getSize(context).height * 0.03),
                  CustomTextField(
                    labelText: "E-mail",
                    icon: Icons.email,
                    controller: emailController,
                    onChanged: cubit.emailChanged,
                  ),
                  SizedBox(height: ScreenSize.getSize(context).height * 0.02),
                  CustomTextField(
                    labelText: "Şifre",
                    icon: Icons.lock,
                    controller: passwordController,
                    isPassword: true,
                    onChanged: cubit.passwordChanged,
                  ),
                  SizedBox(height: ScreenSize.getSize(context).height * 0.02),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0, top: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Şifremi Unuttum",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenSize.getSize(context).height * 0.03),
                  state.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : DefaultButton(
                          text: "Giriş Yap",
                          onTap: () {
                            cubit.login();
                          },
                        ),
                  SizedBox(height: ScreenSize.getSize(context).height * 0.03),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DifferentLoginButton(
                            imagePath: "assets/icons/google-icon.png",
                            onTap: () {},
                          ),
                          SizedBox(
                              width: ScreenSize.getSize(context).width * 0.03),
                          DifferentLoginButton(
                            imagePath: "assets/icons/apple-icon.png",
                            onTap: () {},
                          ),
                          SizedBox(
                              width: ScreenSize.getSize(context).width * 0.03),
                          DifferentLoginButton(
                            imagePath: "assets/icons/facebook-icon.png",
                            onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                          height: ScreenSize.getSize(context).height * 0.03),
                      _dontHaveAccount(context),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  RichText _dontHaveAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Bir hesabın yok mu ? ",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: "Kayıt ol!",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                PageRoutes.goToSignup(context);
              },
          ),
        ],
      ),
    );
  }
}
