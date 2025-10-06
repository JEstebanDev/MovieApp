import 'package:dio/dio.dart';
import 'package:movies_app/config/constants/environment.dart';
import 'package:movies_app/domain/datasources/actors_datasource.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/infrastructure/mappers/credits_mapper.dart';
import 'package:movies_app/infrastructure/models/moviedb/credits_reponse.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrlMovie,
      queryParameters: {'api_key': Environment.movieDbKey},
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    return CastResponse.fromJson(
      response.data,
    ).cast.map((cast) => CreditsMapper.castToEntity(cast)).toList();
  }
}
