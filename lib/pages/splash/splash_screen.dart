import 'package:flutter/material.dart';
import 'package:shartflix/routes/page_routes.dart';
import 'package:shartflix/themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 0.8;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      PageRoutes.goToLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: _opacity,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 1000),
              scale: _scale,
              curve: Curves.easeInOut,
              child: Container(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  "assets/app-images/SinFlixSplash.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Copyright © 2025 tüm hakları saklıdır",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
