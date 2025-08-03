import 'package:flutter/material.dart';
import 'package:shartflix/model/movie/movie_model.dart';
import 'package:shartflix/themes/app_colors.dart';
import 'movie_title.dart';
import 'movie_description.dart';

class MovieLogo extends StatelessWidget {
  final Movie movie;
  final Size screenSize;

  const MovieLogo({
    super.key,
    required this.movie,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      left: 40,
      right: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.movieLogoColor,
              border: Border.all(width: 2, color: AppColors.movieStrokeColor),
            ),
            child: Center(
              child: Image.asset("assets/icons/logo.png"),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieTitle(title: movie.title),
                SizedBox(height: screenSize.height * 0.004),
                MovieDescription(movie: movie),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
