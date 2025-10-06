import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/infrastructure/models/moviedb/movie_details.dart';
import 'package:movies_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB movieDb) => Movie(
    adult: movieDb.adult,
    backdropPath: getImageUrl(movieDb.backdropPath),
    genreIds: movieDb.genreIds.map((el) => el.toString()).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,
    posterPath: getImageUrl(movieDb.posterPath),
    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );

  static String getImageUrl(String path) {
    if (path.isEmpty) {
      return 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg';
    }
    return 'https://image.tmdb.org/t/p/w500/$path';
  }

  static Movie movieDetailsToEntity(MovieDetails movieDb) => Movie(
    adult: movieDb.adult,
    backdropPath: getImageUrl(movieDb.backdropPath),
    genreIds: movieDb.genres.map((el) => el.name).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,
    posterPath: getImageUrl(movieDb.posterPath),
    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );
}
