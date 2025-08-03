import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/cubit/movie/movie_cubit.dart';
import 'package:shartflix/cubit/auth/auth_cubit.dart';
import 'package:shartflix/cubit/favorite_movie/favorite_movie_cubit.dart';
import 'package:shartflix/cubit/addphoto/photo_cubit.dart';
import 'package:shartflix/pages/splash/splash_screen.dart';
import 'package:shartflix/services/movie_services.dart';
import 'package:shartflix/services/auth_services.dart';
import 'package:shartflix/services/photo_services.dart';
import 'package:shartflix/themes/app_colors.dart';
import 'cubit/theme/theme_cubit.dart';

void main() {
  final authServices = AuthServices();
  final movieServices = MovieServices();
  final photoServices = PhotoServices();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(authServices)),
        BlocProvider(create: (_) => MovieCubit(movieServices: movieServices)),
        BlocProvider(create: (_) => FavoriteMovieCubit(movieServices: movieServices)),
        BlocProvider(create: (_) => PhotoCubit(photoServices)), 
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        AppColors.updateTheme(isDarkMode);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(), 
          darkTheme: ThemeData.dark(),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: SplashScreen(),
        );
      },
    );
  }
}
