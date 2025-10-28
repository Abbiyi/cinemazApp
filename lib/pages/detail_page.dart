import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../theme/app_theme.dart';
import '../widgets/rating_stars.dart';
import '../favorite_manager.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Movie movie;
  bool isFavorite = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movie = ModalRoute.of(context)!.settings.arguments as Movie;
    isFavorite = FavoriteManager.isFavorite(movie);
  }

  void toggleFavorite() {
    setState(() {
      FavoriteManager.toggleFavorite(movie);
      isFavorite = !isFavorite;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isFavorite
              ? '${movie.title} Ditambahkan ke favorit '
              : '${movie.title} Hapus dari favorit ',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(movie.poster),
            ),
            const SizedBox(height: 12),
            Text(
              movie.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text("${movie.language} • ${movie.duration}  "),
                RatingStars(rating: movie.rating, size: 18),
                Text("  ${movie.rating}/10",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  label: Text(movie.genre),
                  backgroundColor: AppTheme.primary.withOpacity(0.2),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text("Director: ${movie.director}",
                style: const TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text(movie.description),
          ],
        ),
      ),
    );
  }
}
