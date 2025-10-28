import 'models/movie_model.dart';

class FavoriteManager {
  static final List<Movie> _favorites = [];

  static List<Movie> get favorites => _favorites;

  static bool isFavorite(Movie movie) {
    return _favorites.any((m) => m.id == movie.id);
  }

  static void toggleFavorite(Movie movie) {
    final isFav = isFavorite(movie);
    if (isFav) {
      _favorites.removeWhere((m) => m.id == movie.id);
    } else {
      _favorites.add(movie);
    }
  }
}
