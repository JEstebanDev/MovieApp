import 'package:flutter_riverpod/legacy.dart';
import 'package:movies_app/domain/entities/provider.dart';
import 'package:movies_app/presentation/providers/providerToWatch/provider_movie_provider.dart';

final whereToProvider =
    StateNotifierProvider<
      WhereToWatchByMovieNotifier,
      Map<String, List<Provider>>
    >((ref) {
      final getWhereToWatchByMovie = ref
          .watch(providersToWatchProvide)
          .getProviderByMovieId;
      return WhereToWatchByMovieNotifier(
        getProviderToWatchCallBack: getWhereToWatchByMovie,
      );
    });

typedef GetProviderToWatchCallBack =
    Future<List<Provider>> Function(String movieId);

class WhereToWatchByMovieNotifier
    extends StateNotifier<Map<String, List<Provider>>> {
  final GetProviderToWatchCallBack getProviderToWatchCallBack;
  WhereToWatchByMovieNotifier({required this.getProviderToWatchCallBack})
    : super({});

  Future<void> loadProvider(String movieId) async {
    if (state[movieId] != null) return;
    final providersToWatch = await getProviderToWatchCallBack(movieId);
    // Use the movieId variable value as the map key (computed key)
    state = {...state, movieId: providersToWatch};
  }
}
