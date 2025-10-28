import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RatingStars extends StatelessWidget {
  final double rating; // rating antara 0–10
  final double size;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    // konversi dari skala 10 ke 5 bintang
    final double normalized = (rating / 2).clamp(0, 5);
    final int fullStars = normalized.floor();
    final bool hasHalfStar = (normalized - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(Icons.star, color: AppTheme.primary, size: size);
        } else if (index == fullStars && hasHalfStar) {
          return Icon(Icons.star_half, color: AppTheme.primary, size: size);
        } else {
          return Icon(Icons.star_border, color: Colors.grey, size: size);
        }
      }),
    );
  }
}
