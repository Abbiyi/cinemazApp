import 'dart:convert';
import 'package:cinemaz/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/movie_model.dart';
import '../widgets/carousel_banner.dart';
import '../widgets/genre_filter.dart';
import '../widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movies = [];
  String selectedGenre = "All";

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    final jsonString = await rootBundle.loadString('assets/data/movies.json');
    final data = jsonDecode(jsonString);
    setState(() {
      movies = (data['movies'] as List).map((m) => Movie.fromJson(m)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredMovies =
        selectedGenre == "All"
            ? movies
            : movies.where((m) => m.genre == selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(
  title: const Text(
    "Cinemaz",
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.person_outline), // ubah icon menjadi profile
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          ),
        );
      },
    ),
  ],
),

      body:
          movies.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Trending Movies",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CarouselBanner(
                      images: movies.take(3).map((m) => m.poster).toList(),
                    ),
                    const SizedBox(height: 16),
                    GenreFilter(
                      genres: [
                        "All",
                        "Action",
                        "Adventure",
                        "Animation",
                        "Horror",
                        "Drama"
                      ],
                      selected: selectedGenre,
                      onSelect: (g) => setState(() => selectedGenre = g),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "All Movies",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/all'),
                          child: const Text("See all"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 250, // biar cukup
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filteredMovies.length,
                        itemBuilder: (context, index) {
                          final movie = filteredMovies[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: MovieCard(
                              movie: movie,
                              onTap:
                                  () => Navigator.pushNamed(
                                    context,
                                    '/detail',
                                    arguments: movie,
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
