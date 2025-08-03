import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  final String posterUrl;
  final Size screenSize;

  const MoviePoster({
    super.key,
    required this.posterUrl,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height,
      width: double.infinity,
      child: Image.network(
        posterUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.white.withOpacity(0.4),
            child: const Center(
              child: Icon(Icons.broken_image, color: Colors.grey, size: 60),
            ),
          );
        },
      ),
    );
  }
}
