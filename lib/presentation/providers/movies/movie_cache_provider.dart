import 'package:flutter_riverpod/legacy.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/movies/movies_repository_provider.dart';

final movieCacheProvider =
    StateNotifierProvider<MovieCacheNotifier, Map<String, Movie>>((ref) {
      final getMovieById = ref.watch(movieRepositoryProvider).getMovieById;
      return MovieCacheNotifier(getMovieCallBack: getMovieById);
    });

typedef GetMovieCallBack = Future<Movie> Function(String movieId);

class MovieCacheNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallBack getMovieCallBack;
  MovieCacheNotifier({required this.getMovieCallBack}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await getMovieCallBack(movieId);
    state = {...state, movieId: movie};
  }
}
