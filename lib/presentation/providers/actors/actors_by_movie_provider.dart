import 'package:flutter_riverpod/legacy.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/presentation/providers/actors/actors_providers.dart';

final actorsProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((
      ref,
    ) {
      final getActorByMovie = ref
          .watch(actorRepositoryProvider)
          .getActorsByMovie;
      return ActorsByMovieNotifier(getActorCallBack: getActorByMovie);
    });

typedef GetActorsCallBack = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallBack getActorCallBack;
  ActorsByMovieNotifier({required this.getActorCallBack}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActorCallBack(movieId);
    state = {...state, movieId: actors};
  }
}
