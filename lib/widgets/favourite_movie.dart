import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shartflix/themes/app_colors.dart';

import '../model/movie/movie_model.dart';

class FavouriteMovie extends StatelessWidget {
  final List<Movie> favorites;

  const FavouriteMovie({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return  Center(
        child: Text(
          'Favori film bulunamadı.',
          style: TextStyle(color: AppColors.notFoundFavoriteMovieColor),
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: favorites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (context, index) {
            final movie = favorites[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      movie.poster.isNotEmpty
                          ? movie.poster
                          : 'https://via.placeholder.com/300x450?text=No+Image',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                    color: AppColors.favoriteMovieTitleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  movie.director,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.favoriteMovieDescriptionColor,
                    fontSize: 12,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
