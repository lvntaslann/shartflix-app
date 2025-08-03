import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shartflix/themes/app_colors.dart';
import 'package:shartflix/constants/place_older_images.dart';
import '../../utils/size.dart';
import '../../cubit/movie/movie_cubit.dart';
import '../../cubit/movie/movie_state.dart';
import '../../utils/update_posterurl.dart';
import '../../widgets/button/like_button.dart';
import '../../widgets/movie/movie_logo.dart';
import '../../widgets/movie/movie_poster.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final placeHolderImages = PlaceHolderImages.placeholderImages;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieCubit>().fetchMoviesByPage(reset: true);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize.getSize(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: LiquidPullToRefresh(
        color: AppColors.pullToRefreshForegroundColor,
        backgroundColor: AppColors.pullToRefreshBackgroundColor,
        springAnimationDurationInMilliseconds: 350,
        showChildOpacityTransition: true,
        onRefresh: () async {
          context.read<MovieCubit>().reset();
          await context.read<MovieCubit>().fetchMoviesByPage(reset: true);
        },
        child: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state.error != null && state.movies.isEmpty) {
              return Center(
                child: Text(
                  'Hata: ${state.error}',
                  style: TextStyle(color: AppColors.errorTextColor),
                ),
              );
            }

            final movies = state.movies;

            if (movies.isEmpty && !state.isLoading) {
              return Center(
                child: Text(
                  "Film bulunamadı",
                  style: TextStyle(color: AppColors.errorTextColor),
                ),
              );
            }

            return Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemCount:
                      state.hasReachedMax ? movies.length : movies.length + 2,
                  onPageChanged: (index) {
                    final cubit = context.read<MovieCubit>();
                    final state = cubit.state;

                    if (index >= movies.length - 1 &&
                        !state.hasReachedMax &&
                        !state.isPageLoading &&
                        !state.isLoading) {
                      cubit.fetchMoviesByPage();
                    }
                  },
                  itemBuilder: (context, index) {
                    if (index >= movies.length-1) {
                      return state.isPageLoading
                          ? Center(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: CircularProgressIndicator(
                                  color:
                                      AppColors.circularProgresIndicatorColor,
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    }

                    final movie = movies[index];
                    final posterUrl = movie.poster.isNotEmpty
                        ? UpdatePosterurl.upgradePosterUrl(movie.poster,
                            width: 1000)
                        : placeHolderImages[index % placeHolderImages.length];

                    return Stack(
                      children: [
                        MoviePoster(
                            posterUrl: posterUrl, screenSize: screenSize),
                        Container(
                          height: screenSize.height,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0.2),
                        ),
                        MovieLogo(movie: movie, screenSize: screenSize),
                        LikeButton(movie: movie, screenSize: screenSize),
                      ],
                    );
                  },
                ),
                if (movies.isEmpty)
                  Center(
                    child: CircularProgressIndicator(
                      color: AppColors.circularProgresIndicatorColor,
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
