import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GenreFilter extends StatelessWidget {
  final List<String> genres;
  final String selected;
  final Function(String) onSelect;

  const GenreFilter({
    super.key,
    required this.genres,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          final isSelected = genre == selected;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ChoiceChip(
              label: Text(genre),
              selected: isSelected,
              selectedColor: AppTheme.primary,
              onSelected: (_) => onSelect(genre),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
