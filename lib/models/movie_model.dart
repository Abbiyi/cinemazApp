class Movie {
  final int id;
  final String title;
  final String genre;
  final String language;
  final String duration;
  final double rating;
  final String year;
  final String poster;
  final String director;
  final String description;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.language,
    required this.duration,
    required this.rating,
    required this.year,
    required this.poster,
    required this.director,
    required this.description,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      genre: json['genre'],
      language: json['language'],
      duration: json['duration'],
      rating: json['rating'].toDouble(),
      year: json['year'],
      poster: json['poster'],
      director: json['director'],
      description: json['description'],
    );
  }
}
