import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/movies/movies_repository_provider.dart';

// Initial Load movies

final initialLoadingProvider = Provider<bool>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final topRatedMovies = ref.watch(getTopRatedMoviesProvider).isEmpty;
  final upComingMovies = ref.watch(getUpComingMoviesProvider).isEmpty;
  final popularMovies = ref.watch(getPopularMoviesProvider).isEmpty;
  if (nowPlayingMovies || topRatedMovies || upComingMovies || popularMovies) {
    return true;
  }
  return false;
});

final getUpComingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpComing;
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

final getTopRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

final getPopularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

//Crea un provider que expone un MoviesNotifier
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

/*
Cualquier función que reciba un parámetro page (int) 
y devuelva un Future<List<Movie>> puede llamarse MovieCallBack
*/
typedef MovieCallBack = Future<List<Movie>> Function({int page});

//Maneja un estado de tipo List<Movie> (una lista de películas).
class MoviesNotifier extends StateNotifier<List<Movie>> {
  bool isLoading = false;
  int currentPage = 0;
  MovieCallBack fetchMoreMovies;
  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final movie = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movie];
    // Para darle tiempo de renderizado sin estar haciendo tantas peticiones
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
