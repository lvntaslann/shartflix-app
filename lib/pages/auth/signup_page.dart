import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/routes/page_routes.dart';
import 'package:shartflix/widgets/anim/success_confetti.dart';
import '../../cubit/auth/auth_state.dart';
import '../../themes/app_colors.dart';
import '../../utils/size.dart';
import '../../widgets/button/default_button.dart';
import '../../widgets/button/different_login_button.dart';
import '../../widgets/text/auth_text.dart';
import '../../widgets/textfield/custom_textfield.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../services/auth_services.dart';
import '../add_photo/add_photo_page.dart';
import 'package:confetti/confetti.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController retryPasswordController = TextEditingController();
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerCenterRight;

  @override
  void initState() {
    super.initState();
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 1));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controllerCenterLeft.dispose();
    _controllerCenterRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(AuthServices()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error!,
                    style: TextStyle(color: Colors.red),
                  ),
                  backgroundColor: Colors.white,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }

            if (state.user != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _controllerCenterLeft.play();
                _controllerCenterRight.play();
                Future.delayed(const Duration(milliseconds: 2500), () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex) => AddPhotoPage()));
                });
              });
            }
          },
          builder: (context, state) {
            final cubit = context.read<AuthCubit>();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SuccessConfetti(
                        controller: _controllerCenterLeft,
                        alignment: Alignment.centerLeft),
                    SuccessConfetti(
                        controller: _controllerCenterRight,
                        alignment: Alignment.centerRight),
                    SizedBox(height: ScreenSize.getSize(context).height * 0.20),
                    const TextWidget(text: "Hoşgeldiniz"),
                    const SizedBox(height: 10),
                    Text(
                      "Tempus varius a vitae interdum id\ntortor elementum tristique eleifend at.",
                      style: TextStyle(
                        color: AppColors.authDescTextColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenSize.getSize(context).height * 0.03),
                    CustomTextField(
                      labelText: "Ad Soyad",
                      icon: Icons.person_add,
                      controller: nameController,
                      onChanged: cubit.nameChanged,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: "E-mail",
                      icon: Icons.email,
                      controller: emailController,
                      onChanged: cubit.emailChanged,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: "Şifre",
                      icon: Icons.lock,
                      controller: passwordController,
                      isPassword: true,
                      onChanged: cubit.passwordChanged,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      labelText: "Şifre Tekrar",
                      icon: Icons.lock,
                      isPassword: true,
                      controller: retryPasswordController,
                    ),
                    const SizedBox(height: 20),
                    _userAgreement(),
                    const SizedBox(height: 20),
                    state.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : DefaultButton(
                            text: "Şimdi Kaydol",
                            onTap: () {
                              if (passwordController.text !=
                                  retryPasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Şifreler eşleşmiyor")),
                                );
                              } else if (nameController.text.isEmpty ||
                                  emailController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Lütfen tüm alanları doldurun")),
                                );
                              } else {
                                cubit.register();
                              }
                            },
                          ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DifferentLoginButton(
                                imagePath: "assets/icons/google-icon.png",
                                onTap: () {}),
                            const SizedBox(width: 15),
                            DifferentLoginButton(
                                imagePath: "assets/icons/apple-icon.png",
                                onTap: () {}),
                            const SizedBox(width: 15),
                            DifferentLoginButton(
                                imagePath: "assets/icons/facebook-icon.png",
                                onTap: () {}),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _alreadyAccountText(context)
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  RichText _alreadyAccountText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Zaten hesabın var mı? ",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: "Giriş Yap!",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                PageRoutes.goToLogin(context);
              },
          ),
        ],
      ),
    );
  }

  Text _userAgreement() {
    return Text.rich(
      TextSpan(
        text: '',
        children: [
          TextSpan(
            text: "Kullanıcı sözleşmesini",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
          const TextSpan(
            text: " okudum ve kabul ediyorum.",
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: " Bu\n",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: "sözleşmeyi okuyarak devam ediniz lütfen.",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
