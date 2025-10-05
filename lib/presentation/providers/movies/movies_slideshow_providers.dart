import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/movies/movies_providers.dart';

final moviesSlideshowProvider = Provider((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if (nowPlayingMovies.isEmpty) {
    return <Movie>[];
  }
  return nowPlayingMovies.where((el) {
    return el.popularity > 300;
  }).toList();
});
