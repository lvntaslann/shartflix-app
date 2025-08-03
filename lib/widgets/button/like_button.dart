import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/model/movie/movie_model.dart';
import 'package:shartflix/themes/app_colors.dart';
import '../../cubit/favorite_movie/favorite_movie_cubit.dart';
import '../../cubit/movie/movie_cubit.dart';
class LikeButton extends StatefulWidget {
  final Movie movie;
  final Size screenSize;

  const LikeButton({
    Key? key,
    required this.movie,
    required this.screenSize,
  }) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> with TickerProviderStateMixin {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.movie.isFavorite;
  }

  void _onTap() async {
    await context.read<MovieCubit>().toggleFavorite(widget.movie.movieId);
    context.read<FavoriteMovieCubit>().fetchFavorites();

    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 125,
      right: 20,
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          width: widget.screenSize.width * 0.15,
          height: widget.screenSize.height * 0.10,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(82),
            border: Border.all(
              width: 1,
              color: AppColors.favoriteButtonStrokeColor,
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(
                scale: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInCirc,
                ),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey<bool>(_isFavorite),
              color: _isFavorite
                  ? AppColors.favoriteButtonActiveIconColor
                  : AppColors.favoriteButtonPasiveIconColor,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
