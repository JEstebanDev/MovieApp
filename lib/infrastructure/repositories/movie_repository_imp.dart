import 'package:movies_app/domain/datasources/movies_datasource.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';

class MovieRepositoryImp extends MoviesRepository {
  final MoviesDatasource moviesDatasource;

  MovieRepositoryImp(this.moviesDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDatasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return moviesDatasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return moviesDatasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) {
    return moviesDatasource.getUpComing(page: page);
  }
}
