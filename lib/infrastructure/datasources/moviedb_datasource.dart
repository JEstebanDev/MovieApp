import 'package:dio/dio.dart';
import 'package:movies_app/config/constants/environment.dart';
import 'package:movies_app/domain/datasources/movies_datasource.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/infrastructure/datasources/now.dart';
import 'package:movies_app/infrastructure/mappers/movie_mapper.dart';
import 'package:movies_app/infrastructure/models/moviedb/moviedb_response.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrlMovie,
      queryParameters: {'api_key': Environment.movieDbKey},
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // final response = mockJson;

    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    return _fetchMovies(response);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
      queryParameters: {'page': page},
    );
    return _fetchMovies(response);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
      queryParameters: {'page': page},
    );
    return _fetchMovies(response);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page},
    );
    return _fetchMovies(response);
  }

  Future<List<Movie>> _fetchMovies(Response<dynamic> response) async {
    try {
      return MovieDbResponse.fromJson(response.data).results
          .where(
            (element) => !element.posterPath.contains('upload.wikimedia.org'),
          )
          .map((e) => MovieMapper.movieDbToEntity(e))
          .toList();
    } catch (e) {
      // Handle error appropriately (log, rethrow, return empty list, etc.)
      rethrow;
    }
  }
}
