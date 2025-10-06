// This is Immutable
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:movies_app/infrastructure/repositories/actors_repository_imp.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImp(ActorMovieDbDatasource());
});
