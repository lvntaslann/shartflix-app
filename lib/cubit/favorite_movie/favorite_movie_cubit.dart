import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/movie_services.dart';
import '../../utils/update_posterurl.dart';
import 'favorite_movie_state.dart';

class FavoriteMovieCubit extends Cubit<FavoriteMovieState> {
  final MovieServices movieServices;

  FavoriteMovieCubit({required this.movieServices})
      : super(const FavoriteMovieState());

  Future<void> fetchFavorites() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final favorites = await movieServices.getFavoriteMovies();
      final updatedFavorites = favorites.map((movie) {
        final upgradedPoster = movie.poster.isNotEmpty
            ? UpdatePosterurl.upgradePosterUrl(movie.poster, width: 1000)
            : movie.poster;

        return movie.copyWith(poster: upgradedPoster);
      }).toList();

      emit(state.copyWith(favorites: updatedFavorites, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }
}
