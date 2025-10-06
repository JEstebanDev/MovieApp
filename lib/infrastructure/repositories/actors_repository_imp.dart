import 'package:movies_app/domain/datasources/actors_datasource.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/domain/repositories/actors_repository.dart';

class ActorsRepositoryImp extends ActorsRepository {
  final ActorsDatasource actorsDatasource;

  ActorsRepositoryImp(this.actorsDatasource);
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorsDatasource.getActorsByMovie(movieId);
  }
}
