import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shartflix/model/movie/movie_model.dart';
import 'package:shartflix/themes/app_colors.dart';

class MovieDescription extends StatelessWidget {
  final Movie movie;

  const MovieDescription({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: movie.plot.length > 60
            ? '${movie.plot.substring(0, 60)}... '
            : movie.plot,
        style:  TextStyle(
          color: AppColors.movieDescTextColor,
          fontSize: 15,
          height: 1.4,
        ),
        children: [
          if (movie.plot.length > 60)
            TextSpan(
              text: 'Daha Fazlası',
              style:  TextStyle(
                color: AppColors.moreTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.black87,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (_) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              movie.plot,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
            ),
        ],
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
